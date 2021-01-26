using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Projeto.EncomendasFornecedor
{
    public partial class EncomendasFornece : Form
    {
        public EncomendasFornece()
        {
            InitializeComponent();
        }
        //botao eliminar
        private void button4_Click(object sender, EventArgs e)
        {

        }
        //botao procurar
        private void button3_Click(object sender, EventArgs e)
        {

        }
        //botao encomenda fornecedor
        private void button2_Click(object sender, EventArgs e)
        {
            EncomendarMP encomendar = new EncomendarMP();
            this.Hide();
            encomendar.Show();
        }
        //botao editar encomenda
        private void button5_Click(object sender, EventArgs e)
        {

        }
    }
}
