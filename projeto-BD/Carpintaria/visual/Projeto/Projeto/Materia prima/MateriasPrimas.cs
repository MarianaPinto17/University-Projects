using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using Projeto.Materia_prima;

namespace Projeto
{
    public partial class MateriasPrimas : Form
    {
        public MateriasPrimas()
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
        //botao adicionar materia prima
        private void button5_Click(object sender, EventArgs e)
        {
            AddMP addMP = new AddMP();
            this.Hide();
            addMP.Show();
        }
        //botao editar MP
        private void button6_Click(object sender, EventArgs e)
        {
            nome.Enabled = true;
            quantidade.Enabled = true;
            preco.Enabled = true;
            tamanho.Enabled = true;
            tempsec.Enabled = true;
            marca.Enabled = true;
            cor.Enabled = true;
            // ver fornecedores melhor forma
            //forn.Enabled = true;
        }

        private void button2_Click(object sender, EventArgs e)
        {
            EncomendarMP encomendar = new EncomendarMP();
            this.Hide();
            encomendar.Show();
        }

        private void tel_TextChanged(object sender, EventArgs e)
        {

        }

        private void listBox2_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}
