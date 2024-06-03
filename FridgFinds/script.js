document.addEventListener("DOMContentLoaded", function () {
    var addButton = document.querySelector('.add-element');
    addButton.addEventListener('click', function () {
        // Redireccionar a otro archivo HTML
        window.location.href = "buscador.html";
    });
});



function eliminarElemento() {
    // Aquí puedes agregar la lógica para eliminar un elemento de la lista de la compra
    var listaCompra = document.getElementById("shopping-list");
    var ultimoElemento = listaCompra.lastElementChild;
    listaCompra.removeChild(ultimoElemento);
}
document.addEventListener("DOMContentLoaded", function () {
    var addButton = document.querySelector('.add-ingredient-button');
    addButton.addEventListener('click', function () {
        // Obtener el valor del ingrediente del input en el frame-1
        var nuevoIngrediente = document.querySelector('.ingredient-input').value.trim();

        // Verificar si el campo de ingrediente está vacío
        if (nuevoIngrediente !== "") {
            // Crear un nuevo elemento de lista
            var nuevoElementoLista = document.createElement("li");
            nuevoElementoLista.textContent = nuevoIngrediente;

            // Agregar el nuevo elemento a la lista de la compra en la pantalla lista_de_la_compra_3.html
            var listaCompra = window.opener.document.getElementById("shopping-list");
            listaCompra.appendChild(nuevoElementoLista);

            // Limpiar el campo de ingrediente
            document.querySelector('.ingredient-input').value = "";

            // Cerrar la ventana de búsqueda después de agregar el ingrediente
            window.close();
        } else {
            alert("Por favor, ingresa un ingrediente válido.");
        }
    });
});

document.addEventListener("DOMContentLoaded", function () {
    var addButton = document.getElementById("agregarBtn");
    addButton.addEventListener('click', function () {
        var nuevoIngredienteInput = document.getElementById("nuevoIngrediente");
        var nuevoIngrediente = nuevoIngredienteInput.value.trim();

        if (nuevoIngrediente !== "") {
            var shoppingList = document.getElementById("shopping-list");
            var nuevoElemento = document.createElement("li");
            nuevoElemento.textContent = nuevoIngrediente;
            shoppingList.appendChild(nuevoElemento);
            nuevoIngredienteInput.value = "";
        } else {
            alert("Please enter a valid ingredient.");
        }
    });
});

document.addEventListener('DOMContentLoaded', () => {
    const ingredientInput = document.getElementById('comida');
    const addButton = document.querySelector('.add-ingredient-button');

    addButton.addEventListener('click', () => {
        const ingredient = ingredientInput.value.trim();
        if (ingredient) {
            // Obtén la lista actual del localStorage
            const ingredients = JSON.parse(localStorage.getItem('shoppingList')) || [];
            // Agrega el nuevo ingrediente
            ingredients.push(ingredient);
            // Guarda la lista actualizada en el localStorage
            localStorage.setItem('shoppingList', JSON.stringify(ingredients));
            // Limpia el input
            ingredientInput.value = '';
        }
    });
});

document.addEventListener('DOMContentLoaded', () => {
    const shoppingList = document.getElementById('shopping-list');

    function updateShoppingList() {
        // Obtén la lista actual del localStorage
        const ingredients = JSON.parse(localStorage.getItem('shoppingList')) || [];
        // Limpia el contenido actual del ul
        shoppingList.innerHTML = '';
        // Añade los ingredientes a la lista
        ingredients.forEach(item => {
            const li = document.createElement('li');
            li.textContent = item;
            shoppingList.appendChild(li);
        });
    }

    // Actualiza la lista al cargar la página
    updateShoppingList();

    window.deleteElement = function() {
        // Obtén la lista actual del localStorage
        let ingredients = JSON.parse(localStorage.getItem('shoppingList')) || [];
        if (ingredients.length > 0) {
            // Elimina el último elemento del array
            ingredients.pop();
            // Actualiza el localStorage con la lista actualizada
            localStorage.setItem('shoppingList', JSON.stringify(ingredients));
            // Actualiza la lista en el DOM
            updateShoppingList();
        }
    };
});

function deleteElement() {
    var shoppingList = document.getElementById("shopping-list");
    var lastElement = shoppingList.lastElementChild;
    shoppingList.removeChild(lastElement);
}

function verListaCompra() {
    window.location.href = "lista_de_la_compra_3.html";
}

