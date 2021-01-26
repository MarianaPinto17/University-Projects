using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BD_APF
{
    [Serializable()]
    public class Aluno
    {
        private UInt32 _id;
        private String _nome;
        private DateTime _dataInscricao;
        private String _telemovel;
        private String _cc;
        private Boolean _atestado_medico;
        private String _email;
        private String morada;
        private String cod_postal;

        public UInt32 Id { get => _id; set => _id = value; }
        public string Nome { get => _nome; set => _nome = value; }
        public DateTime DataInscricao { get => _dataInscricao; set => _dataInscricao = value; }
        public string Telemovel { get => _telemovel; set => _telemovel = value; }
        public string Cc { get => _cc; set => _cc = value; }
        public bool Atestado_medico { get => _atestado_medico; set => _atestado_medico = value; }
        public string Email { get => _email; set => _email = value; }
        public string Morada { get => morada; set => morada = value; }
        public string Cod_postal { get => cod_postal; set => cod_postal = value; }

        public Aluno() : base() { }
        public Aluno(String nome, String cc, String telemovel) : base()
        {
            this._nome = nome;
            this._cc = cc;
            this._telemovel = nome;
        }

        public override string ToString()
        {
            return _id + "\t\t" + _nome;
        }
    }
    [Serializable()]
    public class Instrutor
    {
        private String nome;
        private String nif;
        private String telemovel;
        private String morada;


        public Instrutor() : base() { }
        public Instrutor(String nome, String nif, String telemovel) : base()
        {
            this.nome = nome;
            this.nif = nif;
            this.telemovel = telemovel;
        }

        public string Nome { get => nome; set => nome = value; }
        public string Nif { get => nif; set => nif = value; }
        public string Telemovel { get => telemovel; set => telemovel = value; }
        public string Morada { get => morada; set => morada = value; }

        public override string ToString()
        {
            return nif + "\t" + nome + "\t\t" + telemovel + "\t" + morada;
        }
    }
    [Serializable()]
    public class Pacote
    {
        private int _id;
        private double _preco;
        private int n_aulas;

        public int ID { get => _id; set => _id = value; }
        public double Preco { get => _preco; set => _preco = value; }
        public int Num_aulas { get => n_aulas; set => n_aulas = value; }


        public Pacote() : base() { }
        public Pacote(double preco, int n_aulas) : base()
        {
            this._preco = preco;
            this.n_aulas = n_aulas;

        }

        public override string ToString()
        {
            return _id + "\t\t" + _preco + "\t\t" + n_aulas + "\t\t";
        }
    }

    [Serializable()]
    public class Exam
    {
        private int _id;
        private String _local;
        private System.Data.SqlTypes.SqlDateTime _data;
        private String _estado;
        public int ID { get => _id; set => _id = value; }
        public String Local { get => _local; set => _local = value; }
        public String estado { get => _estado; set => _estado = value; }
        public System.Data.SqlTypes.SqlDateTime data { get => _data; set => _data = value; }
        public Exam() : base() { }
        public Exam(String local, System.Data.SqlTypes.SqlDateTime data, String estado)
        {
            this._local = local;
            this._data = data;
            this._estado = estado;
        }
        public override string ToString()
        {
            return _id + "\t\t" + _local + "\t\t" + _data + "\t\t" + _estado + "\t\t";
        }
    }
    [Serializable()]
    public class CodeExam : Exam
    {
        private int _id;
        private String _local;
        private System.Data.SqlTypes.SqlDateTime _data;
        private String _estado;
        public CodeExam() : base() { }
        public CodeExam(String local, System.Data.SqlTypes.SqlDateTime data, String estado)
            : base(local, data, estado)
        {
            this._id = ID;
            this._local = local;
            this._data = data;
            this._estado = estado;
        }

    }
    [Serializable()]
    public class DrivingExam : Exam
    {
        private String _examinador;
        private int _tipocarta;
        private int _veiculo;
        public int tipo_carta { get => _tipocarta; set => _tipocarta = value; }
        public int veiculo { get => _veiculo; set => _veiculo = value; }
        public String examinador { get => _examinador; set => _examinador = value; }
        private int _id;
        private String _local;
        private System.Data.SqlTypes.SqlDateTime _data;
        private String _estado;
        public DrivingExam() : base() { }
        public DrivingExam(String local, System.Data.SqlTypes.SqlDateTime data, String estado, String examinador, int tipocarta, int veiculo)
            : base(local, data, estado)
        {
            this._id = ID;
            this._local = local;
            this._data = data;
            this._estado = estado;
            this._examinador = examinador;
            this._tipocarta = tipocarta;
            this._veiculo = veiculo;
        }
        public override string ToString()
        {
            return _id + "\t" + _local + "\t" + data + "\t" + _tipocarta + "\t" + _veiculo + "\t" + estado + "\t" + examinador + "\t";
        }
    }
    [Serializable()]
    public class Vehicle
    {
        private int _id;
        private int _tipo_veiculo;
        private String _matricula;
        private int _ano;
        private String _marca;
        private String _modelo;
        private System.Data.SqlTypes.SqlDateTime _inspecao;
        private System.Data.SqlTypes.SqlBinary _disponibilidade;
        private int _peso;

        public int ID { get => _id; set => _id = value; }
        public int tipoveiculo { get => _tipo_veiculo; set => _tipo_veiculo = value; }
        public String matricula { get => _matricula; set => _matricula = value; }
        public int ano { get => _ano; set => _ano = value; }
        public String marca { get => _marca; set => _marca = value; }
        public String modelo { get => _modelo; set => _modelo = value; }
        public System.Data.SqlTypes.SqlDateTime inspecao { get => _inspecao; set => _inspecao = value; }
        public System.Data.SqlTypes.SqlBinary disponibilidade { get => _disponibilidade; set => _disponibilidade = value; }
        public int peso { get => _peso; set => _peso = value; }

        public override string ToString()
        {
            return _id + " " + _tipo_veiculo + " " + _matricula + " " + _ano + " " + _marca + " " + _modelo
                + " " + _inspecao + " " + _disponibilidade + " " + _peso;
        }



    }

    [Serializable()]
    public class Aula
    {

        private int _id;
        private System.Data.SqlTypes.SqlDateTime _data;
        private String _instrutor;

    }

}


