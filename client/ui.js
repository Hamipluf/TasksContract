const taskForm = document.querySelector("#taskForm")

taskForm.addEventListener("submit", (e) => {
    e.preventDefault(); // Cancelando el refresh automatico
    const title = taskForm["title"].value;
    const description = taskForm["description"].value;
    App.createTask(title, description); 
})