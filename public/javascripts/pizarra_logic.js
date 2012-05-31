/*    
 *  Contiene listado de funciones que manejan los aviso y pizarra
 *
 *--------------------------------------------------------------------------*/

/**********************************************************
            Reemplaza en la cadena los signo mayor
            y menor en la cadena       
**********************************************************/

function reemplazaCadena (cadena) {
      cadena = cadena.replace(/&/gi, "|q;q");
      cadena = cadena.replace(/[?]/gi, "|q;cq");
      cadena = cadena.replace(/\\/gi, "|q;lcq");
      cadena = cadena.replace(/#/gi, "|plcq");
      return cadena;  
     
} 

/**********************************************************
            Reemplaza en la cadena los signo mayor
            y menor en la cadena       
**********************************************************/


function reemplazaCadenaEnDiv (cadenaEndiv) {
   cadenaEndiv = cadenaEndiv.replace(/\|q\;lcq/gi,'\\' );
   cadenaEndiv = cadenaEndiv.replace(/\|plcq/gi,'#' );
   return cadenaEndiv;  
}       
/**********************************************************
      Elimina espacios en blanco de las cadenas       
**********************************************************/

function trim(cadena)   {
    for( i=0; i<cadena.length; )
    {
        if(cadena.charAt(i) == " ")
            cadena=cadena.substring(i+1, cadena.length);
        else
            break;
    }

    for( i=cadena.length-1; i>=0; i=cadena.length-1)
    {
        if(cadena.charAt(i)==" ")
            cadena=cadena.substring(0,i);
        else
            break;
    }
    
    return cadena;
} 

/**********************************************************
      Retorna la propiedad value del texarea de FCKEDITOR       
**********************************************************/
  
  function contenidos () {
    var formulario = document.getElementById ('formAviso');
    var contenido;
    var oEditor = FCKeditorAPI.GetInstance('aviso__contenido_editor');
    contenido = oEditor.GetXHTML(true);
    document.getElementById("aviso__contenido_editor").value = contenido;
    
    contenido = reemplazaCadena (document.getElementById("aviso__contenido_editor").value);
    
    return contenido;
    
  }
 
/**********************************************************
      Retorna la cadena obtenida por la funcionalidad contenidos 
      con unescape       
**********************************************************/

 function unEscape () {
    var valorUnEscape = unescape (contenidos ());
    return valorUnEscape;
 }


/**********************************************************
      Modifica la propiedad src de la images trash     
**********************************************************/

 function fill_trash() {
    $('trash').src = "/images/trashfull.jpg";
 }       

/**********************************************************
      Modifica la propiedad src de la images trash     
**********************************************************/
  
 function empty_trash() {
    $('trash').src = "/images/trash.jpg";
 }

/**********************************************************
     Imprime contenido en un div dado un valor y 
     el id del div     
**********************************************************/
 
function imprimeContenido (valor,id) {
     valorCadena = reemplazaCadenaEnDiv (valor);
     div = document.getElementById(id);
     div.innerHTML = "";
     div.innerHTML += "</br></br>&nbsp;" + valorCadena;
     
}

/**********************************************************
  Retorna valor de id de checkbox si esta selecciono
**********************************************************/
 
function estado_checked (id_checkbox) {
     checkbox_pizarra = document.getElementById (id_checkbox);
     if (checkbox_pizarra.checked) {
       return true;
     } else {
      return false;
     } 
     
     
}

/**********************************************************
  Retorna la fecha de vencimiento de la nota
**********************************************************/
 
function fecha_vencimiento (id_input_calendar) {
  calendar_date = document.getElementById (id_input_calendar);
  return calendar_date.value;
     
}

/**********************************************************
  Retorna la fecha de vencimiento de inicio de publicacion
**********************************************************/
 
function fecha_publicacion (id_input_calendar) {
  calendar_date = document.getElementById (id_input_calendar);
  return calendar_date.value;
     
}


/**********************************************************
  Limpia input text 
**********************************************************/
 
function limpia_text (id_input_calendar) {
  calendar_date = document.getElementById (id_input_calendar);
  calendar_date.value = "";
}

       