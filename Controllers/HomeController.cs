﻿using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using PreguntadORT.Models;

namespace PreguntadORT.Controllers;

public class HomeController : Controller
{
    private readonly ILogger<HomeController> _logger;

    public HomeController(ILogger<HomeController> logger)
    {
        _logger = logger;
    }

    public IActionResult Index()
    {
        ViewBag.mensajeInicio = "Bienvenido a PreguntadORT!";
        return View("Index");
    }

    public IActionResult Datos(string username, int puntajeFinal)
    {
        ViewBag.username = username;
        ViewBag.puntajeFinal = puntajeFinal;
        return View("Fin");
    }
    public IActionResult ConfigurarJuego()
    {
        Juego.InicializarJuego();
        ViewBag.categorias = BD.ObtenerCategorias();
        ViewBag.dificultades = BD.ObtenerDificultad();
        return View("ConfigurarJuego");
    }

    public IActionResult Comenzar(string username, int dificultad, int categoria){
        Juego.CargarPartida(username, dificultad, categoria);
        if(listaPreguntas.Count() > 0){
            return RedirectToAction("Jugar");
        }
        return RedirectToAction("ConfigurarJuego");
    }

    public IActionResult Jugar(int idPreg){
        ViewBag.pregActual = Juego.ObtenerProximaPregunta();
        if(Juego._preguntas.Count() > 0){
            ViewBag.rtaActual = Juego.ObtenerProximaRespuesta(idPreg);
            return View("Juego");
        }     
        return View("Fin");
    }


    [HttpPost] public IActionResult VerificarRespuesta(int idPregunta, int idRespuesta){
        if(Juego.VerificarRespuesta(idPregunta, idRespuesta)){
            ViewBag.rtaCorrecta = "Correcta!";
        }
        else ViewBag.rtaIncorrecta = "Incorrecta";
        return View("Respuesta");
    }

    public IActionResult Privacy()
    {
        return View();
    }

    [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
    public IActionResult Error()
    {
        return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
    }
}