# from rest_framework import generics
# from .models import Todo
# from .serializers import TodoSerializer
#
# class TodoListCreate(generics.ListCreateAPIView):
#     queryset = Todo.objects.all()
#     serializer_class = TodoSerializer
from django.shortcuts import render, get_object_or_404, redirect
from .models import Todo
from .forms import TodoForm

# View for listing all Todos
def todo_list(request):
    todos = Todo.objects.all()
    return render(request, 'todo/todo_list.html', {'todos': todos})

# View for a single Todo detail
def todo_detail(request, pk):
    todo = get_object_or_404(Todo, pk=pk)
    return render(request, 'todo/todo_detail.html', {'todo': todo})

# View for creating a new Todo
def todo_create(request):
    if request.method == 'POST':
        form = TodoForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('todo-list')
    else:
        form = TodoForm()

    return render(request, 'todo/todo_form.html', {'form': form})
