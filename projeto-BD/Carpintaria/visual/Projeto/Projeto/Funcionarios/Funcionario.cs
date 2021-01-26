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
    public partial class Funcionario : Form
    {
        public Funcionario()
        {
            InitializeComponent();
        }
        //botao voltar 
        private void button1_Click(object sender, EventArgs e)
        {
            MainPage mainpage = new MainPage();
            this.Hide();
            mainpage.Show();
        }
        //botao eliminar funcionario
        private void button4_Click(object sender, EventArgs e)
        {

        }
        //botao adicionar funcionario
        private void button5_Click(object sender, EventArgs e)
        {
            AdicionarFuncionario add = new AdicionarFuncionario();
            this.Hide();
            add.Show();
        }
        //botao editar funcionario
        private void button6_Click(object sender, EventArgs e)
        {

        }
        //botao procurar funcionario
        private void button3_Click(object sender, EventArgs e)
        {

        }
        //botao adicionar encomendas a cargo
        private void button2_Click(object sender, EventArgs e)
        {
            AddEncomendasCargo add = new AddEncomendasCargo();
            this.Hide();
            add.Show();
        }
    }
}
