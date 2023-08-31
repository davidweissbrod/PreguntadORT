public class Categoria{
    public int IdCategoria {get;  set;}
    public string Nombre {get; set;}
    
    public Categoria(int idCat, string nom){
        IdCategoria = idCat;
        Nombre = nom;
    }
}