using System.Data.SqlClient;
using Dapper;
public static class BD
{
    private static string ConnectionString { get; set; } = @"Server=localhost;DataBase=PreguntadORT_BD;Trusted_Connection=True;";
    private static string _connectionString = @"Server=localhost;DataBase=PreguntadORT_BD;Trusted_Connection=True;";

    private static List<Categoria> listaCat = new List<Categoria>{};
    private static List<Dificultad> listaDif = new List<Dificultad>{};
    private static List<Preguntas> listaPre = new List<Preguntas>{};

    public static List<Categoria> ObtenerCategorias(){
        string sql = "SELECT * Nombre FROM Categorias";
        using(SqlConnection db = new SqlConnection(_connectionString))
        {
            listaCat = db.Query<Categoria>(sql).ToList();
        }
        return listaCat;
    }

    public static List<Dificultad> ObtenerDificultad(){
        string sql = "SELECT * Nombre FROM Dificultades";
        using(SqlConnection db = new SqlConnection(_connectionString))
        {
            listaDif = db.Query<Dificultad>(sql).ToList();
        }
        return listaDif;
    }

    public static List<Preguntas> ObtenerPreguntas(int dificultad, int categoria){
        string sql = "SELECT Preguntas WHERE IdDificultad = @dificultad AND IdCategoria = @categoria";
        using(SqlConnection db = new SqlConnection(_connectionString))
        {
            listaPre = db.Query<Preguntas>(sql).ToList();
        }
        return listaPre;
    }

    public static List<Respuestas> ObtenerRespuestas(List<Preguntas> listaPre){
        string sql = "SELECT * Contenido FROM Respuestas";
        List<Respuestas> listaRes = new List<Respuestas>{};
        using(SqlConnection db = new SqlConnection(_connectionString))
        {
            listaRes = db.Query<Respuestas>(sql).ToList();
        }
        return listaRes;
    }
}