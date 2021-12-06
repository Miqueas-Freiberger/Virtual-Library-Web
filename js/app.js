"use strict";

const API_URL = "../api/comentarios";
let comentarios = [];

let app = new Vue({
    el: "#app",
    data: {
        commentsData: [],
    }

})

async function getAll() {
    try {
        let response = await fetch(API_URL);
        let data = await response.json();

        app.commentsData = data;
    }
    catch (e) {
        console.log(e)
    }
}

document.querySelector("#filtroPuntaje").addEventListener('click', getCommentsByRating);

async function getCommentsByRating() {
    let filtro = document.querySelector("#filtroPuntaje");
    let puntaje = filtro.value;
    try{
        let response = await fetch (`${API_URL}/${puntaje}`);
        let data = await response.json();

        app.commentsData = data;
    }
    catch (e) {
        console.log(e)
    }
}



let form = document.querySelector("#FormComments");
form.addEventListener('submit', addComment);

async function addComment(e) {
    e.preventDefault();
    let data = new FormData(form);
    let comment = {
        comentario: data.get('comentario'),
        puntuacion: data.get('puntaje'),
        usuario: data.get('usuario'),
        id_libro: data.get('libro'),
    }

    try {
        let response = await fetch(API_URL, {
            method: "POST",
            headers: {
                "Content-Type": "application/json",
            },
            body: JSON.stringify(comment),
        });

        if (response.ok) {
            let comment = await response.json();
            app.commentsData.push(comment);
        }

    } catch (e) {
        console.log(e)
    }
}



getAll();

let formDelete = document.querySelector("#formDeleteComment");
formDelete.addEventListener('submit', deleteComment);

async function deleteComment(e) {
    e.preventDefault();
    let data = new FormData(formDelete);
    let id = data.get('commentId');

    console.log(id);
    try {
        let response = await fetch(`${API_URL}/${id}`, {
            "method": "DELETE",
        })
        if (response.ok) {
            console.log("Se elimino correctamente");
            getAll();
        }

    } catch (e) {
        console.log(e);
    }
}
