using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;
using Projeto.Artigos;
using Projeto.Funcionarios;
using Projeto.Clientes;

namespace Projeto
{
    public partial class MainPage : Form
    {
        private SqlConnection cn;
        //private int currentCarpintaria;

        public MainPage()
        {
            cn = getSGBDConnection();
            InitializeComponent();
        }


        private void MainPage_Load(object sender, EventArgs e)
        {
            if (!verifySGBDConnection())
                return;
            //vai buscar os dados da carpintaria
            SqlCommand cmd = new SqlCommand("SELECT * FROM Projeto.Table_Carpintaria", cn);
            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                nome.Text = reader[0].ToString();
                nif.Text = reader[1].ToString();
                tel.Text = reader[2].ToString();
                mail.Text = reader[3].ToString();
                morada.Text = reader[4].ToString();
            }

            cn.Close();            
        }

        private SqlConnection getSGBDConnection()
        {
            return new SqlConnection("Data Source=(localdb)\\MSSQLLocalDB;Initial Catalog=Projeto;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False;ApplicationIntent=ReadWrite;MultiSubnetFailover=False");
        }

        private bool verifySGBDConnection()
        {
            if (cn == null)
                cn = getSGBDConnection();

            if (cn.State != ConnectionState.Open)
                cn.Open();

            return cn.State == ConnectionState.Open;
        }

        private void morada_TextChanged(object sender, EventArgs e)
        {

        }

        //editar carpintaria
        private void button6_Click_1(object sender, EventArgs e)
        {
            nome.Enabled = true;
            nif.Enabled = true;
            tel.Enabled = true;
            mail.Enabled = true;
            encom.Enabled = true;
            forne.Enabled = true;
            morada.Enabled= true;
        }

        //guardar alterações
        private void button5_Click(object sender, EventArgs e)
        {
            /**
                    try
                    {
                         = nome.Text;
                        contact.ContactName = nif.Text;
                        contact.Address1 = tel.Text;
                        contact.City = mail.Text;
                        contact.State = nenco.Text;
                        contact.ZIP = nforne.Text;
                        contact.Country = morada.Text;

                    }
                    catch (Exception ex)
                    {
                        MessageBox.Show(ex.Message);
                        return false;
                    }
                **/
            /**
            int rows = 0;

            if (!verifySGBDConnection())
                return;
            SqlCommand cmd = new SqlCommand();

            cmd.CommandText = "UPDATE Table_Carpintaria " + "SET Nome = @Nome, " + "    NIF = @NIF, " + "    Telefone = @Telefone, " + "    mail = @mail, " + "    nencomendas = @nencomendas, " + "    nfornecedores = @nfornecedores, " + "    moradora = @morada " + "WHERE ID = @ID";
            cmd.Parameters.Clear();
            cmd.Parameters.AddWithValue("@Nome", nome.Text);
            cmd.Parameters.AddWithValue("@NIF", nif.Text);
            cmd.Parameters.AddWithValue("@Telefone", tel.Text);
            cmd.Parameters.AddWithValue("@mail", mail.Text);
            cmd.Parameters.AddWithValue("@nencomendas", nenco.Text);
            cmd.Parameters.AddWithValue("@nfornecedores", nforne.Text);
            cmd.Parameters.AddWithValue("@morada", morada.Text);
            cmd.Connection = cn;

            try
            {
                rows = cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                throw new Exception("Failed to update Carpintaria in database. \n ERROR MESSAGE: \n" + ex.Message);
            }
            finally
            {
                if (rows == 1)
                    MessageBox.Show("Update OK");
                else
                    MessageBox.Show("Update NOT OK");

                cn.Close();
            }
    **/
            nome.Enabled = false;
            nif.Enabled = false;
            tel.Enabled = false;
            mail.Enabled = false;
            encom.Enabled = false;
            forne.Enabled = false;
            morada.Enabled = false;
        }

        //botão encomendas de clientes
        private void button1_Click(object sender, EventArgs e)
        {
            Encomendas encomendas = new Encomendas();
            this.Hide();
            encomendas.Show();
        }

        //botão clientes
        private void button3_Click(object sender, EventArgs e)
        {
            Cliente clientes = new Cliente();
            this.Hide();
            clientes.Show();
        }

        //botao Fornecedores
        private void button2_Click(object sender, EventArgs e)
        {
            Fornecedores fornecedores = new Fornecedores();
            this.Hide();
            fornecedores.Show();
        }

        //botão matéria prima
        private void button4_Click(object sender, EventArgs e)
        {
            MateriasPrimas materias = new MateriasPrimas();
            this.Hide();
            materias.Show();
        }

        private void groupBox2_Enter(object sender, EventArgs e)
        {

        }
        //Encomendas materias primas
        private void button7_Click(object sender, EventArgs e)
        {
            EncomendasMP encomendasMP = new EncomendasMP();
            this.Hide();
            encomendasMP.Show();
        }
        //botao funcionarios
        private void button8_Click(object sender, EventArgs e)
        {
            Funcionario funcionarios = new Funcionario();
            this.Hide();
            funcionarios.Show();
        }
        //botao Artigos
        private void button9_Click(object sender, EventArgs e)
        {
            Artigo artigos = new Artigo();
            this.Hide();
            artigos.Show();
        }
    }
}
