import { useEffect, useState } from "react"
import { GET_TODOS, NEW_TODO } from '../../ApiUrls'
import { TodoForm } from "./TodoForm";
export const Todo = () => {
    const [todos, setTodos] = useState([]);

    useEffect(() => {
        const fetchTodo = async () => {
            const response = await fetch(GET_TODOS);
            if (!response.ok) {
                throw new Error('Failed to fetch todos');
            }
            const json = await response.json();
            setTodos(json);
        }
        fetchTodo();
    }, [])
    function getCookie(name) {
        let cookieValue = null;
        if (document.cookie && document.cookie !== '') {
            const cookies = document.cookie.split(';');
            for (let i = 0; i < cookies.length; i++) {
                const cookie = cookies[i].trim();
                if (cookie.substring(0, name.length + 1) === (name + '=')) {
                    cookieValue = decodeURIComponent(cookie.substring(name.length + 1));
                    break;
                }
            }
        }
        return cookieValue;
    }
    const handleNew = async (form) => {
        const csrftoken = getCookie('csrftoken');
        const response = await fetch(NEW_TODO,
            {
                method: 'POST',
                headers: {
                    'Content-type': 'application/json',
                    'X-CSRFToken': csrftoken,
                },
                body: JSON.stringify({
                    form
                })

            }
        );
        if (!response.ok) {
            throw new Error("Failed to submit");
        }

        setTodos(prev => [...prev, form])
    }
    return (
        <main>
            <TodoForm onSubmit={handleNew} />
            <ul>
                {todos.length == 0 ? <p>No Todos Found</p> : todos.map(item =>
                    <li key={item.id}>
                        {item.title}
                    </li>)}
            </ul>
        </main>
    )
}
