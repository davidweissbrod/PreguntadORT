public static class Juego{
    private string username{get; set;}
    private int puntuajeActual{get; set;}
    private int cantidadPreguntasCorrectas{get; set;}
    private List<Preguntas> listaPreguntas{get; set;}
    private List<Respuestas> listaRespuestas{get; set;}

    public static Juego(string user, int puntAct, int cantPregsCorr, List<string> listPreg, List<string> listRes){
        username = user;
        puntuajeActual = puntAct;
        cantidadPreguntasCorrectas = cantPregsCorr;
        listaPreguntas = listPreg;
        listaRespuestas = listRes;
    }

    public static void InicializarJuego(){
        username = "";
        puntuajeActual = 0;
        cantidadPreguntasCorrectas = 0;
    }

    public static List<Categoria> ObtenerCategorias(){
        return BD.ObtenerCategorias();
    }

    public static List<Dificultad> ObtenerDificultades(){
        return BD.ObtenerDificultad();
    }
    public static void CargarPartida(string username, int dificultad, int categoria)
    {
        listaPreguntas = BD.ObtenerPreguntas(dificultad, categoria);
        listaRespuestas = BD.ObtenerRespuestas(listaPreguntas);
    }

    public string ObtenerProximaPregunta(){
        Random rnd = new Random();
        int num = rnd.Next(1, listaPreguntas.Count()+1);
        string pregunta = listaPreguntas[num];
        return pregunta;
    }

    public List<Respuestas> ObtenerProximaRespuesta(int idPregunta){
        List<Respuestas> listaRtas = listaRespuestas.Where(r => r.IdPregunta == IdPregunta).ToList();
        return listaRtas;
    }

    public bool VerificarRespuesta(int idPregunta, int idRespuesta){
        int i = 0;
        bool correcta = false;
        while(i < listaRespuestas.Count()){
            if(listaRespuestas[i].Correcta){
                puntajeActual += 1;
                cantidadPreguntasCorrectas += 1;
                listaPreguntas.RemoveAt(0);
                correcta = true;
            } 
        } 
        return correcta;
    }
}   