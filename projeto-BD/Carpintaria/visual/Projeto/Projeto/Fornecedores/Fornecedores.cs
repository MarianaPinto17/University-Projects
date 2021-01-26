using Projeto.Artigos;
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
    public partial class Fornecedores : Form
    {
        public Fornecedores()
        {
            InitializeComponent();
        }
        //back button
        private void button1_Click(object sender, EventArgs e)
        {
            MainPage mainpage = new MainPage();
            this.Hide();
            mainpage.Show();
        }

        private void listBox1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
        //botao eliminar
        private void button4_Click(object sender, EventArgs e)
        {

        }
        // botao adicionar fornecedor
        private void button5_Click(object sender, EventArgs e)
        {
            AddFornecedor add = new AddFornecedor();
            this.Hide();
            add.Show();
        }
        //editar fornecedor
        private void button6_Click(object sender, EventArgs e)
        {

        }
        //botao procurar
        private void button3_Click(object sender, EventArgs e)
        {

        }
        //botao encomendar fornecedor
        private void button2_Click(object sender, EventArgs e)
        {
            EncomendarMP encomendar = new EncomendarMP();
            this.Hide();
            encomendar.Show();
        }
        //botao voltar
        private void button1_Click_1(object sender, EventArgs e)
        {
            MainPage main = new MainPage();
            this.Hide();
            main.Show();
        }
    }
}
