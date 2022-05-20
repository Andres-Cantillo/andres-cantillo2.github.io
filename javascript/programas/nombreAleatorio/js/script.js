

var test = "test"

function speakVoice(message){
    
    if (!'speechSynthesis' in window) return alert("Lo siento, tu navegador no soporta esta tecnología");
    speechSynthesis.speak(new SpeechSynthesisUtterance(message.innerHTML))

    console.log(message)
}

async function main(){




    var vid = document.getElementById('tamborVideo');
    
    console.log(vid)
    vid.play();

    document.getElementById('tamborSound').play();

    var myAudio = new Audio('audioTambor.m4a');
    myAudio.play();
    function delay(n){
        return new Promise(function(resolve){
            setTimeout(resolve,n*1000);
    });
    }

    

    var x = 0;
    while(x < 41){
        x = x + 1
        var nombres = [
            "Blazquez El Rabih, Pedro Jose",
            "Burgos Márquez, Luis",
            "Camargo Malagón, Álvaro",
            "Cobos Marfil, Blanca",
            "Lucena Tienda, Javier",
            "Luna Velázquez, Guadalupe",
            "Pedraza Gálvez, Juan Rafael",
            "Ranchal Parrado, Juan",
            "Rengel Chustas , Jesús",
            "Ruiz Ruiz, Francisco de Asís",
            "Salado Palomares, Álvaro",
            "Torres Torres, Pablo",
            "Cantillo Jiménez, Andrés"
            ]
    
        var winnerNumber = Math.trunc(Math.random() * ((nombres.length) - 0) + 0);
    
        var message = document.getElementById("winMessage")
    
    
        message.innerHTML = "El ganador es: " + nombres[winnerNumber]
        await delay(0.1);

        
    }
    
    speakVoice(message)

}


