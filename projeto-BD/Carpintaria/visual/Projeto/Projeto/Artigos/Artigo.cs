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

namespace Projeto.Artigos
{
    public partial class Artigo : Form
    {
        public Artigo()
        {
            InitializeComponent();
        }
        //botão adicionar um novo artigo 
        private void button5_Click(object sender, EventArgs e)
        {
            AdicionarArtigo artigo = new AdicionarArtigo();
            this.Hide();
            artigo.Show();
        }
        // botao voltar
        private void button1_Click(object sender, EventArgs e)
        {
            MainPage mainpage = new MainPage();
            this.Hide();
            mainpage.Show();
        }
        // botao adicionar materia prima ao artigo 
        private void button7_Click(object sender, EventArgs e)
        {
            AddMateriaPrima mat = new AddMateriaPrima();
            this.Hide();
            mat.Show();
        }
        //botao editar artigo
        private void button6_Click(object sender, EventArgs e)
        {

        }
        //botao eliminar artigo
        private void button4_Click(object sender, EventArgs e)
        {

        }
        //botao procurar
        private void button3_Click(object sender, EventArgs e)
        {

        }
        //botao encomendar artigo
        private void button2_Click(object sender, EventArgs e)
        {
            AddEncomendaCliente addecomenda = new AddEncomendaCliente();
            this.Hide();
            addecomenda.Show();
        }
    }
}
