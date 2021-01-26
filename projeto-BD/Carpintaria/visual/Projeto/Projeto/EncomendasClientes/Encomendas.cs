using Projeto.Clientes;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Projeto
{
    public partial class Encomendas : Form
    {
        public Encomendas()
        {
            InitializeComponent();
        }
        //botão adicionar artigos à encomenda
        private void button2_Click(object sender, EventArgs e)
        {
            Projeto.Clientes.AdicionarArtigo add = new Projeto.Clientes.AdicionarArtigo();
            this.Hide();
            add.Show();
        }
        //botao voltar
        private void button1_Click_1(object sender, EventArgs e)
        {
            MainPage mainpage = new MainPage();
            this.Hide();
            mainpage.Show();
        }
        //botao adicionar encomenda de clientes
        private void button5_Click(object sender, EventArgs e)
        {
            Projeto.Clientes.AddEncomendaCliente addencomenda = new Projeto.Clientes.AddEncomendaCliente();
            this.Hide();
            addencomenda.Show();
        }
        //botão editar Encomenda
        private void button6_Click(object sender, EventArgs e)
        {

        }
        //botao eliminar encomenda
        private void button4_Click(object sender, EventArgs e)
        {

        }
        //botão procurar encomenda
        private void button3_Click(object sender, EventArgs e)
        {

        }
    }
}
