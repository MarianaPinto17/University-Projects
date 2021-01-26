using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Carpintaria
{
    public partial class Form1 : Form
    {
        private SqlConnection con;
        private int atualFuncionario = 1, atualCliente = 1, atualFornecedor = 1, atualArtigo = 1;
        private int atualEncomendaCliente=1, atualEncomendaFornecedor = 1, atualMateria = 1;
        public Form1()
        {
            InitializeComponent();
            AtualizarFuncionarios();
            AtualizarClientes();
            AtualizarFornecedores();
            AtualizarArtigos();
            AtualizarMateria();
            AtualizarEncomendaCliente();
            AtualizarEncomendaFornecedor();
        }
        
        //CONECTION HERE
        private SqlConnection getSGBDConnection()
        {
            return new SqlConnection("Data Source=tcp:mednat.ieeta.pt\\SQLSERVER,8101;User ID=p3g4;Password=********;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False;ApplicationIntent=ReadWrite;MultiSubnetFailover=False");
        }
        private bool verifySGBDConnection()
        {
            if (con == null)
                con = getSGBDConnection();
            if (con.State != ConnectionState.Open)
                con.Open();
            return con.State == ConnectionState.Open;
        }

        /////////////////////FUNCIONARIOS/////////////////////

        //Mostrar todos os funcionários 
        private void mostrarFuncinario()
        {
            if (Funcionarios.Items.Count == 0)
                return;
            Funcionario funcionario = new Funcionario();
            funcionario = (Funcionario)Funcionarios.Items[atualFuncionario];
            textFnome.Text = funcionario.Nome;
            textFnif.Text = funcionario.Nif;
            textFmail.Text = funcionario.Mail;
            textFtel.Text = funcionario.Tel;
            textFmorada.Text = funcionario.Morada;
            textFsalario.Text = funcionario.Salario;
        }
        
        private void Funcionarios_SelectedIndexChanged(object sender, EventArgs e)
        {
            if(Funcionarios.SelectedIndex >= 0)
            {
                atualFuncionario = Funcionarios.SelectedIndex;
                mostrarFuncinario();
            }
        }

        private void AtualizarFuncionarios()
        {
            if(!verifySGBDConnection())
                return;
            SqlCommand cmd = new SqlCommand("Projeto.getFuncionario", con);
            SqlDataReader reader = cmd.ExecuteReader();
            Funcionarios.Items.Clear();

            while (reader.Read())
            {
                Funcionario funcionario = new Funcionario();
                funcionario.Id = Convert.ToUInt32(reader["id"]);
                funcionario.Nome = reader["nome"].ToString();
                funcionario.Nif = reader["nif"].ToString();
                funcionario.Tel = reader["tel"].ToString();
                funcionario.Mail = reader["mail"].ToString();
                funcionario.Morada = reader["morada"].ToString();
                funcionario.Salario = reader["salario"].ToString();
                Funcionarios.Items.Add(funcionario);
            }
            reader.Close();
        }

        //Inserir Funcionário
        private void InserirFuncionario(Funcionario funcionario)
        {
            int valid = 0;

            if (!verifySGBDConnection())
                return;
            using (SqlCommand cmd = new SqlCommand("Projeto.InsertFuncionario", con))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@nome", funcionario.Nome);
                cmd.Parameters.AddWithValue("@nif", funcionario.Nif);
                cmd.Parameters.AddWithValue("@tel", funcionario.Tel);
                cmd.Parameters.AddWithValue("@mail", funcionario.Mail);
                cmd.Parameters.AddWithValue("@morada", funcionario.Morada);
                cmd.Parameters.AddWithValue("@salario", funcionario.Salario);
                cmd.Connection = con;

                try
                {
                    valid = cmd.ExecuteNonQuery();
                }
                catch (Exception ex)
                {
                    throw new Exception("Falha a inserir Funcionário. \n Menssagem de Erro: \n" + ex.Message);
                }
                finally
                {
                    if (valid == 1)
                        MessageBox.Show("Inserção Válida");
                    else
                        MessageBox.Show("Inserção Inválida");
                }
            }
            AtualizarFuncionarios();
            con.Close();
        }

        //Botão Adicionar Funcionário
        private void button1_Click(object sender, EventArgs e)
        {
            Funcionario funcionario = new Funcionario();

            try
            {
                funcionario.Nome = textFnome.Text;
                funcionario.Nif = textFnif.Text;
                funcionario.Mail = textFmail.Text;
                funcionario.Tel = textFtel.Text;
                funcionario.Morada = textFmorada.Text;
                funcionario.Salario = textFsalario.Text;
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
            InserirFuncionario(funcionario);
            Funcionarios.Items.Add(funcionario);
            AtualizarFuncionarios();
        }

        //Atualizar Funcionário
        private void updateFuncionario(Funcionario funcionario)
        {
            
            int valid = 0;

            if (!verifySGBDConnection())
                return;
            SqlCommand cmd = new SqlCommand();
            
            cmd.CommandText = "EXEC Projeto.UpdateFuncionario " +
                "@nome = _nome, " +
                "@nif = _nif, " +
                "@tel = _tel, " +
                "@mail = _mail, " +
                "@morada = _morada , " +
                "@salario = _salario";
            
            //cmd.CommandText = "UPDATE Table_Funcionario " + "SET Nome = @nome, " + "    Nif = @nif, " + "   Tel = @tel, " + "    Mail = @mail, " + "    morada = @Morada, " + "   salario  = @Salario, " + "WHERE id = @Id";
            cmd.Parameters.Clear();
            cmd.Parameters.AddWithValue("@ids", funcionario.Id);
            cmd.Parameters.AddWithValue("@nome", funcionario.Nome);
            cmd.Parameters.AddWithValue("@nif", funcionario.Nif);
            cmd.Parameters.AddWithValue("@tel", funcionario.Tel);
            cmd.Parameters.AddWithValue("@mail", funcionario.Mail);
            cmd.Parameters.AddWithValue("@morada", funcionario.Morada);
            cmd.Parameters.AddWithValue("@salario", funcionario.Salario);
            cmd.Connection = con;

            try
            {
                valid = cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                throw new Exception("Falha na atualização do Funcionário. \n Mensagem de Erro: \n" + ex.Message);
            }
            finally
            {
                if (valid == 1)
                    MessageBox.Show("Atualização Válida");
                else
                    MessageBox.Show("Atualização Inválida");
            }
            AtualizarFuncionarios();
            con.Close();
            
            
        }
        //Botão de Editar Funcionário
        private void button2_Click(object sender, EventArgs e)
        {
                
                Funcionario funcionario = new Funcionario();

                try
                {
                    funcionario.Id = ((Funcionario)Funcionarios.Items[atualFuncionario]).Id;
                    funcionario.Nome = textFnome.Text;
                    funcionario.Nif = textFnif.Text;
                    funcionario.Mail = textFmail.Text;
                    funcionario.Tel = textFtel.Text;
                    funcionario.Morada = textFmorada.Text;
                    funcionario.Salario = textFsalario.Text;
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message);
                }
                updateFuncionario(funcionario);
                

            }

        ///////////////////CLIENTES///////////
        private void InserirCliente(Cliente Cliente)
        {
            int valid = 0;

            if (!verifySGBDConnection())
                return;
            using (SqlCommand cmd = new SqlCommand("Projeto.InsertCliente", con))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@nome", Cliente.Nome);
                cmd.Parameters.AddWithValue("@nif", Cliente.Nif);
                cmd.Parameters.AddWithValue("@tel", Cliente.Tel);
                cmd.Parameters.AddWithValue("@mail", Cliente.Mail);
                cmd.Parameters.AddWithValue("@morada", Cliente.Morada);
                cmd.Connection = con;

                try
                {
                    valid = cmd.ExecuteNonQuery();
                }
                catch (Exception ex)
                {
                    throw new Exception("Falha a inserir Cliente. \n Menssagem de Erro: \n" + ex.Message);
                }
                finally
                {
                    if (valid == 1)
                        MessageBox.Show("Inserção Válida");
                    else
                        MessageBox.Show("Inserção Inválida");
                }
            }
            AtualizarClientes();
            con.Close();
        }

        //Botão Adicionar Cliente
        private void button4_Click(object sender, EventArgs e)
        {
            Cliente cliente = new Cliente();

            try
            {
                cliente.Nome = textCnome.Text;
                cliente.Nif = textCnif.Text;
                cliente.Mail = textCmail.Text;
                cliente.Tel = textCtel.Text;
                cliente.Morada = textCmorada.Text;
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
            InserirCliente(cliente);
            Clientes.Items.Add(cliente);
            AtualizarClientes();
        }

        //Mostrar Clientes
        private void Clientes_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (Clientes.SelectedIndex >= 0)
            {
                atualCliente = Clientes.SelectedIndex;
                mostrarCliente();
            }
        }

        private void mostrarCliente()
        {
            if (Clientes.Items.Count == 0)
                return;
            Cliente cliente = new Cliente();
            cliente = (Cliente)Clientes.Items[atualCliente];
            textCnome.Text = cliente.Nome;
            textCnif.Text = cliente.Nif;
            textCmail.Text = cliente.Mail;
            textCtel.Text = cliente.Tel;
            textCmorada.Text = cliente.Morada;
        }

        private void AtualizarClientes()
        {
            if (!verifySGBDConnection())
                return;
            SqlCommand cmd = new SqlCommand("Projeto.getCliente", con);
            SqlDataReader reader = cmd.ExecuteReader();
            Clientes.Items.Clear();

            while (reader.Read())
            {
                Cliente cliente = new Cliente();
                cliente.Id = Convert.ToUInt32(reader["id"]);
                cliente.Nome = reader["nome"].ToString();
                cliente.Nif = reader["nif"].ToString();
                cliente.Tel = reader["tel"].ToString();
                cliente.Mail = reader["mail"].ToString();
                cliente.Morada = reader["morada"].ToString();
                Clientes.Items.Add(cliente);
            }
            reader.Close();
        }

        /////////////////////FORNECEDORES//////////////

        //Inserir Fornecedores
        private void InserirFornecedor(Fornecedor Fornecedor)
        {
            int valid = 0;

            if (!verifySGBDConnection())
                return;
            using (SqlCommand cmd = new SqlCommand("Projeto.InsertFornecedor", con))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@nome", Fornecedor.Nome);
                cmd.Parameters.AddWithValue("@nif", Fornecedor.Nif);
                cmd.Parameters.AddWithValue("@tel", Fornecedor.Tel);
                cmd.Parameters.AddWithValue("@mail", Fornecedor.Mail);
                cmd.Parameters.AddWithValue("@morada", Fornecedor.Morada);
                cmd.Parameters.AddWithValue("@metodo_pag", Fornecedor.Metodo);
                cmd.Connection = con;

                try
                {
                    valid = cmd.ExecuteNonQuery();
                }
                catch (Exception ex)
                {
                    throw new Exception("Falha a inserir Fornecedor. \n Menssagem de Erro: \n" + ex.Message);
                }
                finally
                {
                    if (valid == 1)
                        MessageBox.Show("Inserção Válida");
                    else
                        MessageBox.Show("Inserção Inválida");
                }
            }
            AtualizarFornecedores();
            con.Close();
        }

        //Botão Adicionar Fornecedores
        private void button7_Click(object sender, EventArgs e)
        {
            Fornecedor fornecedor = new Fornecedor();

            try
            {
                fornecedor.Nome = textFonome.Text;
                fornecedor.Nif = textFonif.Text;
                fornecedor.Mail = textFomail.Text;
                fornecedor.Tel = textFotel.Text;
                fornecedor.Morada = textFomorada.Text;
                fornecedor.Metodo = comboFopaga.Text;
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
            InserirFornecedor(fornecedor);
            Fornecedores.Items.Add(fornecedor);
            AtualizarFornecedores();
        }

        //Mostrar Fornecedores
        private void Fornecedores_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (Fornecedores.SelectedIndex >= 0)
            {
                atualFornecedor = Fornecedores.SelectedIndex;
                mostrarFornecedor();
            }
        }

        private void mostrarFornecedor()
        {
            if (Fornecedores.Items.Count == 0)
                return;
            Fornecedor fornecedor = new Fornecedor();
            fornecedor = (Fornecedor)Fornecedores.Items[atualFornecedor];
            textFonome.Text = fornecedor.Nome;
            textFonif.Text = fornecedor.Nif;
            textFomail.Text = fornecedor.Mail;
            textFotel.Text = fornecedor.Tel;
            textFomorada.Text = fornecedor.Morada;
            comboFopaga.Text = fornecedor.Metodo;
        }

        private void AtualizarFornecedores()
        {
            if (!verifySGBDConnection())
                return;
            SqlCommand cmd = new SqlCommand("Projeto.getFornecedor", con);
            SqlDataReader reader = cmd.ExecuteReader();
            Fornecedores.Items.Clear();

            while (reader.Read())
            {
                Fornecedor fornecedor = new Fornecedor();
                fornecedor.Id = Convert.ToUInt32(reader["id"]);
                fornecedor.Nome = reader["nome"].ToString();
                fornecedor.Nif = reader["nif"].ToString();
                fornecedor.Tel = reader["tel"].ToString();
                fornecedor.Mail = reader["mail"].ToString();
                fornecedor.Morada = reader["morada"].ToString();
                fornecedor.Metodo = reader["metodo_pag"].ToString();
                Fornecedores.Items.Add(fornecedor);
            }
            reader.Close();
        }

        //////////////////////ARTIGOS//////////////////

        //Inserir Artigos
        private void InserirArtigo(Artigo Artigo)
        {
            int valid = 0;

            if (!verifySGBDConnection())
                return;
            using (SqlCommand cmd = new SqlCommand("Projeto.InsertArtigo", con))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@nome", Artigo.Nome);
                cmd.Parameters.AddWithValue("@preco", Artigo.Preco);
                cmd.Parameters.AddWithValue("@quantidade", Artigo.Quantidade);
                cmd.Parameters.AddWithValue("@descricao", Artigo.Descricao);
                cmd.Connection = con;

                try
                {
                    valid = cmd.ExecuteNonQuery();
                }
                catch (Exception ex)
                {
                    throw new Exception("Falha a inserir Artigo. \n Menssagem de Erro: \n" + ex.Message);
                }
                finally
                {
                    if (valid == 1)
                        MessageBox.Show("Inserção Válida");
                    else
                        MessageBox.Show("Inserção Inválida");
                }
            }
            AtualizarArtigos();
            con.Close();
        }

        //Botão de Adicionar Artigos
        private void button10_Click(object sender, EventArgs e)
        {
            Artigo artigo = new Artigo();

            try
            {
                artigo.Nome = textAnome.Text;
                artigo.Preco = textApreco.Text;
                artigo.Quantidade = textAquantidade.Text;
                artigo.Descricao = textAdescricao.Text;
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
            InserirArtigo(artigo);
            Artigos.Items.Add(artigo);
            AtualizarArtigos();
        }

        //Lista de Artigos
        private void Artigos_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (Artigos.SelectedIndex >= 0)
            {
                atualArtigo = Artigos.SelectedIndex;
                mostrarArtigo();
            }
        }

        private void mostrarArtigo()
        {
            if (Artigos.Items.Count == 0)
                return;
            Artigo artigo = new Artigo();
            artigo = (Artigo)Artigos.Items[atualArtigo];
            textAnome.Text = artigo.Nome;
            textAquantidade.Text = artigo.Quantidade;
            textAdescricao.Text = artigo.Descricao;
            textApreco.Text = artigo.Preco;
        }

        private void AtualizarArtigos()
        {
            if (!verifySGBDConnection())
                return;
            SqlCommand cmd = new SqlCommand("Projeto.getArtigo", con);
            SqlDataReader reader = cmd.ExecuteReader();
            Artigos.Items.Clear();

            while (reader.Read())
            {
                Artigo artigo = new Artigo();
                artigo.Id = Convert.ToUInt32(reader["id"]);
                artigo.Nome = reader["nome"].ToString();
                artigo.Quantidade = reader["quantidade"].ToString();
                artigo.Preco = reader["preco"].ToString();
                artigo.Descricao = reader["descricao"].ToString();
                Artigos.Items.Add(artigo);
            }
            reader.Close();
        }


        ////////////////MATERIAS PRIMAS/////////////////

        private void InserirMateriaPrima(MateriaPrima materia)
        {
            int valid = 0;

            if (!verifySGBDConnection())
                return;
            using (SqlCommand cmd = new SqlCommand("Projeto.InsertMateriaPrima", con))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@tipo", materia.Tipo);
                cmd.Parameters.AddWithValue("@quantidade", materia.Quantidade);
                cmd.Parameters.AddWithValue("@preco", materia.Preco);
                cmd.Parameters.AddWithValue("@tamanho", materia.Tamanho);
                cmd.Parameters.AddWithValue("@tempo_seca", materia.Tempo);
                cmd.Parameters.AddWithValue("@marca", materia.Marca);
                cmd.Parameters.AddWithValue("@cor", materia.Cor);
                cmd.Connection = con;

                try
                {
                    valid = cmd.ExecuteNonQuery();
                }
                catch (Exception ex)
                {
                    throw new Exception("Falha a inserir Matéria Prima. \n Menssagem de Erro: \n" + ex.Message);
                }
                finally
                {
                    if (valid == 1)
                        MessageBox.Show("Inserção Válida");
                    else
                        MessageBox.Show("Inserção Inválida");
                }
            }
            AtualizarMateria();
            con.Close();
        }

        //Botão Adicionar Matéria Primas
        private void button13_Click(object sender, EventArgs e)
        {
            MateriaPrima materia = new MateriaPrima();

            try
            {
                materia.Tipo = textMtipo.Text;
                materia.Quantidade = textMquantidade.Text;
                materia.Tamanho = textMtamanho.Text;
                materia.Preco = textMpreco.Text;
                materia.Tempo = textMsecagem.Text;
                materia.Cor = textMcor.Text;
                materia.Marca = textMmarca.Text;
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
            InserirMateriaPrima(materia);
            Materia.Items.Add(materia);
            AtualizarMateria();
        }

        //Listar as Matérias Primas
        private void Materia_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (Materia.SelectedIndex >= 0)
            {
                atualMateria = Materia.SelectedIndex;
                mostrarMateriaPrima();
            }
        }

        private void mostrarMateriaPrima()
        {
            if (Materia.Items.Count == 0)
                return;
            MateriaPrima materia = new MateriaPrima();
            materia = (MateriaPrima)Materia.Items[atualMateria];
            textMtipo.Text = materia.Tipo;
            textMquantidade.Text = materia.Quantidade;
            textMtamanho.Text = materia.Tamanho;
            textMpreco.Text = materia.Preco;
            textMsecagem.Text = materia.Tempo;
            textMcor.Text = materia.Cor;
            textMmarca.Text = materia.Marca;
        }

        private void AtualizarMateria()
        {
            if (!verifySGBDConnection())
                return;
            SqlCommand cmd = new SqlCommand("Projeto.getMateriaPrima", con);
            SqlDataReader reader = cmd.ExecuteReader();
            Materia.Items.Clear();

            while (reader.Read())
            {
                MateriaPrima materia = new MateriaPrima();
                materia.Id = Convert.ToUInt32(reader["id"]);
                materia.Tipo = reader["tipo"].ToString();
                materia.Quantidade = reader["quantidade"].ToString();
                materia.Preco = reader["preco"].ToString();
                materia.Tamanho = reader["tamanho"].ToString();
                materia.Tamanho = reader["tempo_seca"].ToString();
                materia.Marca = reader["marca"].ToString();
                materia.Cor = reader["cor"].ToString();
                Materia.Items.Add(materia);
            }
            reader.Close();
        }

        /////////////////////////Encomendas Clientes//////////////////////////
        private void InserirEncomendaCliente(EncomendaCliente encomenda)
        {
            int valid = 0;

            if (!verifySGBDConnection())
                return;
            using (SqlCommand cmd = new SqlCommand("Projeto.InsertEncomendaCliente", con))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@nif", encomenda.Nif);
                cmd.Parameters.AddWithValue("@data_in", encomenda.Data_in);
                cmd.Parameters.AddWithValue("@data_out", encomenda.Data_out);
                cmd.Parameters.AddWithValue("@descricao", encomenda.Descricao);
                cmd.Parameters.AddWithValue("@estado_prod", encomenda.Estado);
                cmd.Parameters.AddWithValue("@estado_paga", encomenda.Pagamento);
                cmd.Parameters.AddWithValue("@preco", encomenda.Preco);
                cmd.Connection = con;

                try
                {
                    valid = cmd.ExecuteNonQuery();
                }
                catch (Exception ex)
                {
                    throw new Exception("Falha a inserir Encomenda Cliente. \n Menssagem de Erro: \n" + ex.Message);
                }
                finally
                {
                    if (valid == 1)
                        MessageBox.Show("Inserção Válida");
                    else
                        MessageBox.Show("Inserção Inválida");
                }
            }
            AtualizarEncomendaCliente();
            con.Close();
        }
        private void EncomendaCliente_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (EncomendaCliente.SelectedIndex >= 0)
            {
                atualEncomendaCliente = EncomendaCliente.SelectedIndex;
                mostrarEncomendaCliente();
            }
        }

        //Botão Adicionar Encomenda
        private void button16_Click(object sender, EventArgs e)
        {
            EncomendaCliente encomenda = new EncomendaCliente();

            try
            {
                encomenda.Nif = textBox12.Text;
                encomenda.Data_in = Convert.ToDateTime(dateTimePicker1.Text);
                encomenda.Data_out = Convert.ToDateTime(dateTimePicker2.Text);
                encomenda.Descricao = textBox13.Text;
                encomenda.Preco = textBox18.Text;
                encomenda.Estado = comboBox1.Text;
               encomenda.Pagamento = comboBox2.Text;
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
            InserirEncomendaCliente(encomenda);
            EncomendaCliente.Items.Add(encomenda);
            AtualizarEncomendaCliente();
        }

        private void mostrarEncomendaCliente()
        {
            if (EncomendaCliente.Items.Count == 0)
                return;
            EncomendaCliente encomenda = new EncomendaCliente();
            encomenda = (EncomendaCliente)EncomendaCliente.Items[atualEncomendaCliente];
            textBox13.Text = encomenda.Descricao;
            textBox18.Text = encomenda.Preco;
            comboBox1.Text = encomenda.Estado;
            comboBox2.Text = encomenda.Pagamento;
        }

        private void AtualizarEncomendaCliente()
        {
            if (!verifySGBDConnection())
                return;
            SqlCommand cmd = new SqlCommand("Projeto.getEncomendaCliente", con);
            SqlDataReader reader = cmd.ExecuteReader();
            EncomendaCliente.Items.Clear();

            while (reader.Read())
            {
                EncomendaCliente encomenda = new EncomendaCliente();
                encomenda.Id = Convert.ToUInt32(reader["id"]);
                encomenda.Cliente_id = Convert.ToUInt32(reader["cliente_id"]);
                encomenda.Cliente_nome = reader["cliente_nome"].ToString();
                encomenda.Data_in = Convert.ToDateTime(reader["data_in"]);
                encomenda.Data_out = Convert.ToDateTime(reader["data_out"]);
                encomenda.Preco = reader["preco"].ToString();
                encomenda.Descricao = reader["descricao"].ToString();
                encomenda.Estado = reader["estado_prod"].ToString();
                encomenda.Pagamento = reader["estado_paga"].ToString();
                EncomendaCliente.Items.Add(encomenda);
            }
            reader.Close();
        }

        private void fileSystemWatcher1_Changed(object sender, System.IO.FileSystemEventArgs e)
        {

        }
        //atualizar encomenda
        private void button5_Click(object sender, EventArgs e)
        {
           
        }
        //botao remover artigo
        private void button12_Click(object sender, EventArgs e)
        {

        }
        //botao remover funcionario
        private void button3_Click(object sender, EventArgs e)
        {
            if (Funcionarios.SelectedIndex > -1)
            {
                try
                {
                    RemoveFuncionario(((Funcionario)Funcionarios.SelectedItem).Id);
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message);
                    return;
                }
                Funcionarios.Items.RemoveAt(Funcionarios.SelectedIndex);
                if (atualFuncionario == Funcionarios.Items.Count)
                    atualFuncionario = Funcionarios.Items.Count - 1;
                if (atualFuncionario == -1)
                {
                    MessageBox.Show("There are no more contacts");
                }
                else
                {
                    mostrarFuncinario();
                }
            }
        }
        private void RemoveFuncionario(uint funcionarioID)
        {
            if (!verifySGBDConnection())
                return;
            SqlCommand cmd = new SqlCommand();

            cmd.CommandText = "DELETE Table_Funcionario WHERE id=@Id ";
            cmd.Parameters.Clear();
            cmd.Parameters.AddWithValue("@id", funcionarioID);
            cmd.Connection = con;

            try
            {
                cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                throw new Exception("Failed to delete contact in database. \n ERROR MESSAGE: \n" + ex.Message);
            }
            finally
            {
                con.Close();
            }
        }


        /////////////////////////Encomendas Fornecedores//////////////////////
        private void InserirEncomendaFornecedor(EncomendaFornecedor encomenda)
        {
            int valid = 0;

            if (!verifySGBDConnection())
                return;
            using (SqlCommand cmd = new SqlCommand("Projeto.InsertEncomendaFornecedor", con))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@nif", encomenda.Nif);
                cmd.Parameters.AddWithValue("@data_in", encomenda.Data_in);
                cmd.Parameters.AddWithValue("@data_out", encomenda.Data_out);
                cmd.Parameters.AddWithValue("@descrição", encomenda.Descricao);
                cmd.Parameters.AddWithValue("@estado_entrega", encomenda.Estado);
                cmd.Parameters.AddWithValue("@estado_pag", encomenda.Pagamento);
                cmd.Parameters.AddWithValue("@preco", encomenda.Preco);
                cmd.Connection = con;

                try
                {
                    valid = cmd.ExecuteNonQuery();
                }
                catch (Exception ex)
                {
                    throw new Exception("Falha a inserir Encomenda Fornecedor. \n Menssagem de Erro: \n" + ex.Message);
                }
                finally
                {
                    if (valid == 1)
                        MessageBox.Show("Inserção Válida");
                    else
                        MessageBox.Show("Inserção Inválida");
                }
            }
            AtualizarEncomendaFornecedor();
            con.Close();
        }

        //Botão Adicionar Encomenda Fornecedor
        private void button19_Click(object sender, EventArgs e)
        {
            EncomendaFornecedor encomenda = new EncomendaFornecedor();

            try
            {
                encomenda.Nif = textBox19.Text;
                encomenda.Data_in = Convert.ToDateTime(dateTimePicker3.Text);
                encomenda.Data_out = Convert.ToDateTime(dateTimePicker4.Text);
                encomenda.Descricao = textBox22.Text;
                encomenda.Preco = textBox25.Text;
                encomenda.Estado = comboBox3.Text;
                encomenda.Pagamento = comboBox4.Text;
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
            InserirEncomendaFornecedor(encomenda);
            EncomendaFornecedor.Items.Add(encomenda);
            AtualizarEncomendaFornecedor();
        }

        private void EncomendaFornecedor_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (EncomendaFornecedor.SelectedIndex >= 0)
            {
                atualEncomendaFornecedor = EncomendaFornecedor.SelectedIndex;
                mostrarEncomendaFornecedor();
            }
        }

        private void mostrarEncomendaFornecedor()
        {
            if (EncomendaFornecedor.Items.Count == 0)
                return;
            EncomendaFornecedor encomenda = new EncomendaFornecedor();
            encomenda = (EncomendaFornecedor)EncomendaFornecedor.Items[atualEncomendaFornecedor];
            textBox22.Text = encomenda.Descricao;
            textBox25.Text = encomenda.Preco;
            comboBox3.Text = encomenda.Estado;
            comboBox4.Text = encomenda.Pagamento;
        }

        private void AtualizarEncomendaFornecedor()
        {
            if (!verifySGBDConnection())
                return;
            SqlCommand cmd = new SqlCommand("Projeto.getEncomendaFornecedor", con);
            SqlDataReader reader = cmd.ExecuteReader();
            EncomendaFornecedor.Items.Clear();

            while (reader.Read())
            {
                EncomendaFornecedor encomenda = new EncomendaFornecedor();
                encomenda.Id = Convert.ToUInt32(reader["id"]);
                encomenda.Funcionario_id = Convert.ToUInt32(reader["funcionario_id"]);
                encomenda.Funcionario_nome = reader["funcionario_nome"].ToString();
                encomenda.Data_in = Convert.ToDateTime(reader["data_in"]);
                encomenda.Data_out = Convert.ToDateTime(reader["data_out"]);
                encomenda.Preco = reader["preco"].ToString();
                encomenda.Descricao = reader["descrição"].ToString();
                encomenda.Estado = reader["estado_entrega"].ToString();
                encomenda.Pagamento = reader["estado_pag"].ToString();
                EncomendaFornecedor.Items.Add(encomenda);
            }
            reader.Close();
        }

    }
}
