import 'package:bloc/bloc.dart';
import 'package:practicing_bloc_example2/bloc/switch_bloc/switch_event.dart';
import 'package:practicing_bloc_example2/bloc/switch_bloc/switch_state.dart';

class SwitchBloc extends Bloc<SwitchEvent,SwitchState>{
  SwitchBloc():super(SwitchState()){
    on<EnableorDisableEvent>(_EnableorDisableEvent);
    on<SliderEvent>(_SliderEvent);
  }
  void _EnableorDisableEvent(EnableorDisableEvent event,Emitter<SwitchState>emit){
    emit(state.copyWith(isSwitch: !state.isSwitch));
  }

  void _SliderEvent(SliderEvent event,Emitter<SwitchState>emit){
    emit(state.copyWith(slider: event.Slider));
  }
}

