import gleam/json
import lustre
import lustre/effect.{type Effect}
import lustre/element.{type Element}
import lustre/element/html
import lustre/event

pub type Model {
  Model
}

pub type Message

pub fn component() -> lustre.App(_, Model, Message) {
  lustre.component(init:, update:, view:, options: [])
}

fn init(_flags) -> #(Model, Effect(Message)) {
  #(Model, event.emit("ready", json.null()))
}

fn update(model: Model, _message: Message) -> #(Model, Effect(Message)) {
  #(model, effect.none())
}

fn view(_model: Model) -> Element(Message) {
  html.text("hi!")
}
