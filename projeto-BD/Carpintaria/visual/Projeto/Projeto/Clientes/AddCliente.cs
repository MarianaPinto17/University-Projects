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
    public partial class AddCliente : Form
    {
        public AddCliente()
        {
            InitializeComponent();
        }
        //botao adicionar cliente
        private void button5_Click(object sender, EventArgs e)
        {
            MessageBox.Show("Cliente adicionado com sucesso!");
            AddCliente addcliente = new AddCliente();
            this.Hide();
            addcliente.Show();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            AddCliente addcliente = new AddCliente();
            this.Hide();
            addcliente.Show();
        }
    }
}