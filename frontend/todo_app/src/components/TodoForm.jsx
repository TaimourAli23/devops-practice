
export const TodoForm = ({ onSubmit }) => {
    const handleSubmit = async (event) => {
        event.preventDefault();
        const submittedForm = new FormData(event.target);
        const customerData = Object.fromEntries(submittedForm.entries());
        await onSubmit(customerData)
        event.target.reset();
    }

    return (
        <form onSubmit={handleSubmit}>
            <p>
                <label htmlFor="title">Title</label>
                <input type="text" name="title" />
            </p>
            <p>
                <label htmlFor="description">Description</label>
                <input type="text" name="description" />
            </p>
            <p>
                <label htmlFor="completed">Completed</label>
                <input type="checkbox" name="completed" />
            </p>
            <p>
                <button>Submit</button>
            </p>
        </form>
    )
}