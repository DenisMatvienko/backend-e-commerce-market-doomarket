function ajaxSend(url, params) {
    // Send request through the fetch
    fetch(`${url}?${params}`, {
        method: 'GET',
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded',
        },
    })
        .then(response => response.json())
        .then(json => render(json))
        .catch(error => console.error(error))
}

// Find the form by name
const forms = document.querySelector('form[name=filter]');

// When in this form after call method 'submit', start func 
forms.addEventListener('submit', function (e) {
    // Get Form data

    // Cancel the 'defaul event'- reloading page
    // Into variable 'url' assign the information from attribute action from form
    // Make the parametres which will transfer into url, all this data to string. params - is the value and property
    e.preventDefault();
    let url = this.action;
    let params = new URLSearchParams(new FormData(this)).toString();
    ajaxSend(url, params);
});

function render(data) {
    // Template render
    // With Hogan compile html
    // Call render of received template, and transfer json which receive from server
    let template = Hogan.compile(html);
    let output = template.render(data);

    // Find div in which, variable 'html', will wrapp
    const div = document.querySelector('.cards-wrapper');
    div.innerHTML = output;
}

let html = '\
{{#product}}\
    <div class="card card__wishlist---margin">\
        <div class="card__header">\
            <div class="card__sale">SALE 10%</div>\
            <div class="card__icon-btns">\
                <button class="card__icon-btn">\
                    <svg width="21" height="20" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:svgjs="http://svgjs.com/svgjs" viewBox="0 0.366 21 19.268">\
                        <svg xmlns="http://www.w3.org/2000/svg" width="21" height="20" viewBox="2 2 20 18.35">\
                            <path paint-order="stroke fill markers" fill-rule="evenodd" d="M16.5 2c-1.74 0-3.412.81-4.502 2.09C10.91 2.81 9.238 2 7.498 2 4.42 2 2 4.42 2 7.5c0 3.78 3.4 6.86 8.55 11.54l1.448 1.31 1.451-1.32C18.6 14.36 22 11.28 22 7.5 22 4.42 19.58 2 16.5 2zm-4.4 15.55l-.102.1-.1-.1C7.142 13.24 4 10.39 4 7.5 4 5.5 5.5 4 7.499 4c1.54 0 3.04.99 3.57 2.36h1.871C13.46 4.99 14.958 4 16.5 4c2 0 3.499 1.5 3.499 3.5 0 2.89-3.14 5.74-7.899 10.05z"/>\
                        </svg>\
                    </svg>\
                </button>\
            </div>\
         </div>\
        <div class="card__img">\
            <a href="/{{ slug }}">\
                <img src="/media/{{ title_img }}" alt="{{ name }}">\
            </a>\
        </div>\
        <a href="/{{ slug }}">\
            <h4 class="card__title">\
                {{ name }}\
            </h4>\
        </a>\
        <div class="card__footer">\
            <div class="card_price">{{ price }} ₽/шт.</div>\
            <button class="icon__cart">\
                <svg width="21" height="21" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:svgjs="http://svgjs.com/svgjs">\
                    <svg xmlns="http://www.w3.org/2000/svg" width="21" height="21" viewBox="1 1 20 20">\
                        <path paint-order="stroke fill markers" fill-rule="evenodd" d="M7 17c-1.1 0-1.99.9-1.99 2S5.9 21 7 21 9 20.1 9 19s-.9-2-1.998-2zM1 1v2h2l3.6 7.59-1.35 2.45c-.16.28-.25.61-.25.96 0 1.1.9 2 2 2H19v-2H7.42a.247.247 0 0 1-.25-.25l.03-.12.898-1.63h7.452c.75 0 1.41-.41 1.749-1.03l3.579-6.49A1.003 1.003 0 0 0 20 3H5.21l-.94-2H1zm16 16c-1.1 0-1.989.9-1.989 2s.89 2 1.99 2 1.998-.9 1.998-2S18.1 17 17 17z"/>\
                    </svg>\
                </svg>\
            </button>\
        </div>\
    </div>\
    </div>\
{{/product}}'