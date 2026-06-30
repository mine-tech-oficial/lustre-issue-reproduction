import gleam/int
import gleam/json
import lustre
import lustre/effect.{type Effect}
import lustre/element.{type Element}
import lustre/element/html
import lustre/event

pub type Model {
  Model(count: Int)
}

pub type Message {
  Inc
  Dec
}

pub fn component() -> lustre.App(_, Model, Message) {
  lustre.component(init:, update:, view:, options: [])
}

fn init(_flags) -> #(Model, Effect(Message)) {
  #(Model(0), event.emit("ready", json.null()))
}

fn update(model: Model, message: Message) -> #(Model, Effect(Message)) {
  case message {
    Inc -> #(Model(model.count + 1), effect.none())
    Dec -> #(Model(model.count - 1), effect.none())
  }
}

fn view(model: Model) -> Element(Message) {
  element.fragment([
    html.div([], [
      html.button([event.on_click(Inc)], [html.text("+")]),
      html.text(int.to_string(model.count)),
      html.button([event.on_click(Dec)], [html.text("-")]),
    ]),
  ])
}
