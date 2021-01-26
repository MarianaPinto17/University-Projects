using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Projeto.Clientes
{
    public partial class Cliente : Form
    {
        public Cliente()
        {
            InitializeComponent();
        }
        //adicionar cliente
        private void button5_Click(object sender, EventArgs e)
        {
            AddCliente add = new AddCliente();
            this.Hide();
            add.Show();
        }

        private void groupBox1_Enter(object sender, EventArgs e)
        {

        }
        //botao eliminar
        private void button2_Click(object sender, EventArgs e)
        {

        }
        //botao editar cliente
        private void button6_Click(object sender, EventArgs e)
        {

        }
        //botao procurar cliente
        private void button3_Click(object sender, EventArgs e)
        {

        }
        //botao voltar
        private void button1_Click(object sender, EventArgs e)
        {
            MainPage main = new MainPage();
            this.Hide();
            main.Show();
        }
        //fazer encomenda para cliente
        private void button4_Click(object sender, EventArgs e)
        {
            AddEncomendaCliente encomendaCliente = new AddEncomendaCliente();
            this.Hide();
            encomendaCliente.Show();
        }


    }
}
