const $ = (id) => document.getElementById(id);
const textarea = document.getElementById('description');

window.onload = function () {
     /* $("name").addEventListener("focus", function (e) {
         $("msg-name").innerHTML = null;
         this.classList.remove("is-invalid");
     });
  */
    $('name').addEventListener("blur", function (e) {
        switch (true) {
            case !this.value.trim():
                $("msg-name").innerHTML = "Debes ingresar un nombre";
                this.classList.add("is-invalid");
                break;
            case this.value.trim().length < 5:
                $("msg-name").innerHTML = "Debes ingresar como minimo 5 caracteres";
                this.classList.add("is-invalid");
                break;
            case !/^[a-zA-Z0-9\s]*$/.test(this.value.trim()):
                $("msg-name").innerHTML = "Solo se permiten letras y números";
                this.classList.add("is-invalid");
                break;
            default:
                $("msg-name").innerHTML = null;
                this.classList.add("is-valid");
                this.classList.remove("is-invalid");
                break;
        }
    });

    /* textarea.addEventListener("focus", function (e) {
        window.addEventListener("keyup", function (e) {
            let liveKey = textarea.value.length;
            let textareaValue = textarea.value;
            console.log(e.key);

            if (liveKey < 350) {
                $("numTotal").innerText = liveKey;
            } else {
                textarea.value = textareaValue.substring(0, 300);
                e.preventDefault();
            }
        });

        $("msg-description").innerHTML = null;
        this.classList.remove("is-invalid");
    }); */

   /*  textarea.addEventListener("blur", function (e) {
        switch (true) {
            case !/^[a-zA-Z0-9\s]*$/.test(this.value.trim()):
                $("msg-description").innerHTML = "Solo se permiten letras y números";
                this.classList.add("is-invalid");
                break;
            case !this.value:
                $("msg-description").innerHTML = "Debes ingresar una descripción del producto";
                this.classList.add("is-invalid");
                break;
            case this.value.trim().length < 20:
                $("msg-description").innerHTML = "Describa sobre el producto (mínimo 20 caracteres)";
                this.classList.add("is-invalid");
                break;
            case this.value.trim().length > 300:
                $("msg-description").innerHTML = "Unicamente hasta 300 caracteres";
                this.classList.add("is-invalid");
                break;
            default:
                $("msg-description").innerHTML = null;
                this.classList.add("is-valid");
                this.classList.remove("is-invalid");
                break;
        }
    });


    $("brand").addEventListener("focus", function (e) {
        $("msg-brand").innerHTML = null;
        this.classList.remove("is-invalid");
    });

    $("brand").addEventListener("blur", function (e) {
        switch (true) {
            case !this.value.trim():
                $("msg-brand").innerHTML = "Debes ingresar una marca";
                this.classList.add("is-invalid");
                break;
            case this.value.trim().length < 3:
                $("msg-brand").innerHTML = "Debes ingresar como minimo 3 caracteres";
                this.classList.add("is-invalid");
                break;
            case this.value.trim().length > 25:
                $("msg-brand").innerHTML = "Unicamente hasta 25 caracteres";
                this.classList.add("is-invalid");
                break;
            case !/^[a-zA-Z0-9\s]*$/.test(this.value.trim()):
                $("msg-brand").innerHTML = "Solo se permiten letras y números";
                this.classList.add("is-invalid");
                break;
            default:
                $("msg-brand").innerHTML = null;
                this.classList.add("is-valid");
                this.classList.remove("is-invalid");
                break;
        }
    });

    $("price").addEventListener("focus", function (e) {
        $("msg-price").innerHTML = null;
        this.classList.remove("is-invalid");
    });

    $("price").addEventListener("blur", function (e) {
        switch (true) {
            case !this.value:
                $("msg-price").innerHTML = "El producto debe tener un precio";
                this.classList.add("is-invalid");
                break;
            case !/^[0-9]+$/.test(this.value.trim()):
                $("msg-price").innerHTML = "Recuerda que debe ser un número";
                this.classList.add("is-invalid");
                break;
            case this.value <= 0:
                $("msg-price").innerHTML = "El numero no puede ser negativo";
                this.classList.add("is-invalid");
                break;

            default:
                $("msg-price").innerHTML = null;
                this.classList.add("is-valid");
                this.classList.remove("is-invalid");
                break;
        }
    });

    $("discount").addEventListener("focus", function (e) {
        $("msg-discount").innerHTML = null;
        this.classList.remove("is-invalid");
    });

    $("discount").addEventListener("blur", function (e) {
        switch (true) {
            case !/^[0-9]+$/.test(this.value.trim()):
                $("msg-discount").innerHTML = "Debe ser un número o 0 (cero) sin descuento";
                this.classList.add("is-invalid");
                break;
            case this.value < 0:
                $("msg-discount").innerHTML = "El descuento debe ser positivo";
                this.classList.add("is-invalid");
                break;
            case this.value > 100:
                $("msg-discount").innerHTML = "El descuento no puede superar el 100%";
                this.classList.add("is-invalid");
                break;

            default:
                $("msg-discount").innerHTML = null;
                this.classList.add("is-valid");
                this.classList.remove("is-invalid");
                break;
        }
    }); */

    $("productAdd").addEventListener("submit", function (event) {
        event.preventDefault();

        const elementsFormProduct = this.elements;
        let error = false;

        for (let i = 0; i < elementsFormProduct.length; i++) {
            if (elementsFormProduct[i].classList.contains("is-invalid")) {
                error = true;
                elementsFormProduct[i].classList.add("is-invalid");
                $("msg-description").innerHTML = "Por favor verifique el formulario";
            }
        }

        !error && this.submit();
    });
}