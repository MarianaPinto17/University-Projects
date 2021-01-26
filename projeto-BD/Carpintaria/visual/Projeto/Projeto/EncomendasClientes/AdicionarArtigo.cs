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
    public partial class AdicionarArtigo : Form
    {
        public AdicionarArtigo()
        {
            InitializeComponent();
        }
        //botao adicionar artigos
        private void button5_Click(object sender, EventArgs e)
        {
            MessageBox.Show("Artigos adicionados com sucesso!");
            Encomendas encomendas = new Encomendas();
            this.Hide();
            encomendas.Show();
        }
        //botao cancelar
        private void button1_Click(object sender, EventArgs e)
        {
            Encomendas encomendas = new Encomendas();
            this.Hide();
            encomendas.Show();
        }
    }
}
