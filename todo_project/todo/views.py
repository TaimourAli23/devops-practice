import json

from django.http import JsonResponse
from django.shortcuts import get_object_or_404
from django.views.decorators.csrf import csrf_exempt

from .models import Todo
from .forms import TodoForm

# View for listing all Todos as JSON
def todo_list(request):
    todos = Todo.objects.all().values()
    return JsonResponse(list(todos), safe=False)

# View for a single Todo detail as JSON
def todo_detail(request, pk):
    todo = get_object_or_404(Todo, pk=pk)
    return JsonResponse({
        'id': todo.id,
        'title': todo.title,
        'description': todo.description,
        'completed': todo.completed,
    })

@csrf_exempt
def todo_create(request):
    if request.method == 'POST':
        data = json.loads(request.body)
        form = TodoForm(data["form"])
        if form.is_valid():
            todo = form.save()
            return JsonResponse({
                'status': 'success',
                'todo': {
                    'id': todo.id,
                    'title': todo.title,
                    'description': todo.description,
                    'completed': todo.completed,
                }
            })
        else:
            return JsonResponse({'status': 'error', 'errors': form.errors}, status=400)
    return JsonResponse({'status': 'error', 'message': 'Invalid request method'}, status=400)
