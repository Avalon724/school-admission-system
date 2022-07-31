import consumer from "./consumer";

document.addEventListener("turbolinks:load", () => {
  const element = document.getElementById("user-id");
  const user_id = element.getAttribute("data-user-id");

  const notify = document.getElementById("notify");
  var li = document.createElement("li");
  li.className = "text-break";
  console.log(user_id);

  consumer.subscriptions.create(
    { channel: "NotificationChannel", user_id: user_id },
    {
      connected() {
        // Called when the subscription is ready for use on the server
        console.log("Connected to Notification Channel " + user_id);
      },

      disconnected() {
        // Called when the subscription has been terminated by the server
      },

      received(data) {
        // Called when there's incoming data on the websocket for this channel
        console.log(data);
        var h5 = document.createElement("h5");
        h5.className = "mb-3";
        h5.innerHTML = data.message;
        li.appendChild(h5);
        notify.insertBefore(li, notify.children[0]);
      },
    }
  );
});
