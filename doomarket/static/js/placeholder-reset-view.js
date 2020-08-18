// Didnt set placeholder values in forms.py cause they will be set here by using Vanilla JS
// We start indexing at one because csrf_token is considered and input fields 

//Query all input fields 
let form_fields = document.getElementsByTagName('input')
form_fields[1].placeholder='Email..';

for (let field in form_fields){
	form_fields[field].className +=' form-control'
}