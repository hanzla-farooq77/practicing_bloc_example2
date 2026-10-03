

abstract class SwitchEvent  {
  SwitchEvent();
  @override
  List<Object?> get props => [];
}

class EnableorDisableEvent extends SwitchEvent {}


class SliderEvent extends SwitchEvent {
  double Slider;
  SliderEvent({
    required this.Slider
});
  @override
  List<Object?> get props => [Slider];
}

