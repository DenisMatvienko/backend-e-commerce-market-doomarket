// Didnt set placeholder values in forms.py cause they will be set here by using Vanilla JS
// We start indexing at one because csrf_token is considered and input fields 

//Query all input fields 
let form_fields = document.getElementsByTagName('input')
form_fields[1].placeholder='Имя..';
form_fields[2].placeholder='Email..';
form_fields[3].placeholder='Пароль..';
form_fields[4].placeholder='Повторите пароль..';

for (let field in form_fields){
	form_fields[field].className +=' form-control'
}