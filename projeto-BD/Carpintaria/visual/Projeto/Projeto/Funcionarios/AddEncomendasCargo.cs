using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Projeto.Funcionarios
{
    public partial class AddEncomendasCargo : Form
    {
        public AddEncomendasCargo()
        {
            InitializeComponent();
        }
        //botao adicionar encomendas a cargo
        private void button5_Click(object sender, EventArgs e)
        {
            MessageBox.Show("Encomendas adicionada a cargo do funcionário.");
            Fornecedores fornecedores = new Fornecedores();
            this.Hide();
            fornecedores.Show();
        }
        //botao cancelar
        private void button1_Click(object sender, EventArgs e)
        {
            Fornecedores fornecedores = new Fornecedores();
            this.Hide();
            fornecedores.Show();
        }
    }
}
