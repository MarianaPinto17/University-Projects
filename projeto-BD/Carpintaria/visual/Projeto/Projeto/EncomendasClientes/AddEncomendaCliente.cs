using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using Projeto;

namespace Projeto.Clientes
{
    public partial class AddEncomendaCliente : Form
    {
        public AddEncomendaCliente()
        {
            InitializeComponent();
        }

        private void groupBox2_Enter(object sender, EventArgs e)
        {

        }
        //Adicionar Encomenda
        private void button5_Click(object sender, EventArgs e)
        {
            MessageBox.Show("Encomenda adicionada com sucesso");
            Encomendas enc = new Encomendas();
            this.Hide();
            enc.Show();
        }
        //botao cancelar
        private void button1_Click(object sender, EventArgs e)
        {
            Encomendas enc = new Encomendas();
            this.Hide();
            enc.Show();
        }
    }
}
