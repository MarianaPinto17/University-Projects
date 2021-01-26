using System;
using System.Threading.Tasks;

namespace Carpintaria
{

    [Serializable()]
    public class Funcionario
    {
        private UInt32 id;
        private String nome;
        private String nif;
        private String tel;
        private String mail;
        private String morada;
        private String salario;

        public UInt32 Id { get => id; set => id = value; }
        public String Nome { get => nome; set => nome = value; }
        public String Nif { get => nif; set => nif = value; }
        public String Tel { get => tel; set => tel = value; }
        public String Mail { get => mail; set => mail = value; }
        public String Morada { get => morada; set => morada = value; }
        public String Salario { get => salario; set => salario = value; }

        public Funcionario() : base() { }

        public Funcionario(String nome, String nif, String tel, String mail) : base()
        {
            this.nome = nome;
            this.nif = nif;
            this.tel = tel;
            this.mail = mail;
        }

        public override string ToString()
        {
            return id + "\t" + nome + "\t" + nif + "\t" + tel + "\t" + mail;
        }
    }
    [Serializable()]
    public class Cliente
    {
        private UInt32 id;
        private String nome;
        private String nif;
        private String tel;
        private String mail;
        private String morada;

        public UInt32 Id { get => id; set => id = value; }
        public String Nome { get => nome; set => nome = value; }
        public String Nif { get => nif; set => nif = value; }
        public String Tel { get => tel; set => tel = value; }
        public String Mail { get => mail; set => mail = value; }
        public String Morada { get => morada; set => morada = value; }

        public Cliente() : base() { }

        public Cliente(String nome, String nif, String tel, String mail) : base()
        {
            this.nome = nome;
            this.nif = nif;
            this.tel = tel;
            this.mail = mail;
        }

        public override string ToString()
        {
            return id + "\t" + nome + "\t" + nif + "\t" + tel + "\t" + mail;
        }
    }

    [Serializable()]
    public class Fornecedor
    {
        private UInt32 id;
        private String nome;
        private String nif;
        private String tel;
        private String mail;
        private String morada;
        private String metodo;

        public UInt32 Id { get => id; set => id = value; }
        public String Nome { get => nome; set => nome = value; }
        public String Nif { get => nif; set => nif = value; }
        public String Tel { get => tel; set => tel = value; }
        public String Mail { get => mail; set => mail = value; }
        public String Morada { get => morada; set => morada = value; }
        public String Metodo { get => metodo; set => metodo = value; }

        public Fornecedor() : base() { }

        public Fornecedor(String nome, String nif, String tel, String mail) : base()
        {
            this.nome = nome;
            this.nif = nif;
            this.tel = tel;
            this.mail = mail;
        }

        public override string ToString()
        {
            return id + "\t" + nome + "\t" + nif + "\t" + tel + "\t" + mail;
        }
    }

    [Serializable()]
    public class Artigo
    {
        private UInt32 id;
        private String nome;
        private String preco;
        private String quantidade;
        private String descricao;


        public UInt32 Id { get => id; set => id = value; }
        public String Nome { get => nome; set => nome = value; }
        public String Preco { get => preco; set => preco = value; }
        public String Quantidade { get => quantidade; set => quantidade = value; }
        public String Descricao { get => descricao; set => descricao = value; }

        public Artigo() : base() { }

        public Artigo(String nome, String quantidade, String descricao) : base()
        {
            this.nome = nome;
            this.quantidade = quantidade;
            this.descricao = descricao;
        }

        public override string ToString()
        {
            return id + "\t" + nome + "\t" + quantidade + "\t" + descricao;
        }
    }

    [Serializable()]
    public class MateriaPrima
    {
        private UInt32 id;
        private String tipo;
        private String quantidade;
        private String preco;
        private String tamanho;
        private String tempo;
        private String marca;
        private String cor;


        public UInt32 Id { get => id; set => id = value; }
        public String Tipo { get => tipo; set => tipo = value; }
        public String Preco { get => preco; set => preco = value; }
        public String Quantidade { get => quantidade; set => quantidade = value; }
        public String Tamanho { get => tamanho; set => tamanho = value; }
        public String Tempo { get => tempo; set => tempo = value; }
        public String Marca { get => marca; set => marca = value; }
        public String Cor { get => cor; set => cor = value; }

        public MateriaPrima() : base() { }

        public MateriaPrima(String tipo, String quantidade, String marca) : base()
        {
            this.tipo = tipo;
            this.quantidade = quantidade;
            this.marca = marca;
        }

        public override string ToString()
        {
            return id + "\t" + tipo + "\t" + quantidade + "\t" + marca;
        }
    }

    [Serializable()]
    public class EncomendaCliente
    {
        private UInt32 id;
        private String nif;
        private UInt32 cliente_id;
        private String cliente_nome;
        private DateTime data_in;
        private DateTime data_out;
        private String descricao;
        private String preco;
        private String estado;
        private String pagamento;


        public UInt32 Id { get => id; set => id = value; }
        public String Nif { get => nif; set => nif = value; }
        public UInt32 Cliente_id { get => cliente_id; set => cliente_id = value; }
        public String Cliente_nome { get => cliente_nome; set => cliente_nome = value; }
        public DateTime Data_in { get => data_in; set => data_in = value; }
        public DateTime Data_out { get => data_out; set => data_out = value; }
        public String Descricao { get => descricao; set => descricao = value; }
        public String Preco { get => preco; set => preco = value; }
        public String Estado { get => estado; set => estado = value; }
        public String Pagamento { get => pagamento; set => pagamento = value; }
  

        public EncomendaCliente() : base() { }

        public EncomendaCliente(String cliente_nome, String descricao, String estado, String pagamento) : base()
        {
            this.cliente_nome = cliente_nome;
            this.descricao = descricao;
            this.estado = estado;
            this.pagamento= pagamento;

        }

        public override string ToString()
        {
            return id + "\t" + cliente_nome + "\t" + descricao + "\t" + estado + "\t" + pagamento;
        }
    }

    [Serializable()]
    public class EncomendaFornecedor
    {
        private UInt32 id;
        private String nif;
        private UInt32 funcionario_id;
        private String funcionario_nome;
        private DateTime data_in;
        private DateTime data_out;
        private String descricao;
        private String preco;
        private String estado;
        private String pagamento;


        public UInt32 Id { get => id; set => id = value; }
        public String Nif { get => nif; set => nif = value; }
        public UInt32 Funcionario_id { get => funcionario_id; set => funcionario_id = value; }
        public String Funcionario_nome { get => funcionario_nome; set => funcionario_nome = value; }
        public DateTime Data_in { get => data_in; set => data_in = value; }
        public DateTime Data_out { get => data_out; set => data_out = value; }
        public String Descricao { get => descricao; set => descricao = value; }
        public String Preco { get => preco; set => preco = value; }
        public String Estado { get => estado; set => estado = value; }
        public String Pagamento { get => pagamento; set => pagamento = value; }


        public EncomendaFornecedor() : base() { }

        public EncomendaFornecedor(String funcionario_nome, String descricao, String estado, String pagamento) : base()
        {
            this.funcionario_nome = funcionario_nome;
            this.descricao = descricao;
            this.estado = estado;
            this.pagamento = pagamento;

        }

        public override string ToString()
        {
            return id + "\t" + funcionario_nome + "\t" + descricao + "\t" + estado + "\t" + pagamento;
        }
    }
}
