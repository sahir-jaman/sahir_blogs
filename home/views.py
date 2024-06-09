from django.shortcuts import render

# Create your views here.
def homePage(request):
    dict = {'hello': "yo"}
    return render(request, 'home.html',dict)


