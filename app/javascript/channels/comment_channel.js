import consumer from "./consumer"

consumer.subscriptions.create("CommentChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    const html2 = `<p>${data.content.comment_text}</p>`;
    const comments = document.getElementById('comments');
    const newComment = document.getElementById('comment_comment_text');
    comments.insertAdjacentHTML('afterbegin', html2);
    newComment.value='';
  }
});

