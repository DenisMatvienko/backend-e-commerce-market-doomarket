from django.shortcuts import render, redirect
from django.contrib import messages
from django.contrib.auth import authenticate, login, logout
from shop.forms.user_create_form import CreateUserForm


class AccountsView(CreateUserForm):
    """ Account logic """

    def register_page(request):
        """ Create the account by UserCreationForm, operation by forms, redirects and messages """
        form = CreateUserForm()

        if request.method == 'POST':
            form = CreateUserForm(request.POST)
            if form.is_valid():
                form.save()
                user = form.cleaned_data.get('username')
                messages.success(request, 'Ваш аккаунт был успешно создан, ' + user + '!')
                return redirect('login')

        context = {'form': form}
        return render(request, 'account/register-page.html', context)

    def login_page(request):
        """ Login into account, operation by forms, redirects and messages"""
        if request.method == 'POST':
            username = request.POST.get('username')
            password = request.POST.get('password')

            user = authenticate(request, username=username, password=password)

            if user is not None:
                login(request, user)
                messages.success(request, 'Добро пожаловать ' + username + '!')
                return redirect('list')
            else:
                messages.info(request, 'Неверный логин, либо пароль :(')

        context = {}
        return render(request, 'account/login.html', context)

    def logout_user(request):
        """ Logout actions """
        logout(request)
        return redirect('login')