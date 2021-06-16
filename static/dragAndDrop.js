function onDragStart(event) {
  event.dataTransfer.setData('text/plain', event.target.id);
  event.currentTarget.classList.remove('border-gray-700');
  event.currentTarget.classList.add('border-blue-500');
}

function onDragOver(event) {
  event.preventDefault();
}

function onDrop(event, el) {
  event.preventDefault();
  var id = event.dataTransfer.getData('text');
  var draggableElement = document.getElementById(id);
  el.appendChild(draggableElement);
  draggableElement.classList.remove('border-blue-500');
  draggableElement.classList.add('border-gray-700');

  var url = draggableElement.dataset.dropPostUrl;
  var columnId = el.dataset.columnId;

  fetch(url, {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify({ columnId: columnId })
  })
  .catch(console.error)
}