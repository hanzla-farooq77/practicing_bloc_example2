import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/switch_bloc/switch_bloc.dart';
import '../bloc/switch_bloc/switch_event.dart';
import '../bloc/switch_bloc/switch_state.dart';

class SwitchWidget extends StatelessWidget {
  const SwitchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFF6750A4);

    return Scaffold(
      backgroundColor: const Color(0xFFF7F5FC),

      appBar: AppBar(
        title: const Text(
          'Settings',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: false,
        backgroundColor: const Color(0xFFF7F5FC),
        elevation: 0,
      ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              const Text(
                'Customize your experience',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF25213A),
                ),
              ),

              const SizedBox(height: 8),

              const Text(
                'Manage your notification preferences and appearance.',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),

              const SizedBox(height: 30),

              // Notification Card
              BlocBuilder<SwitchBloc, SwitchState>(
                buildWhen: (previous, current) =>
                previous.isSwitch != current.isSwitch,

                builder: (context, state) {
                  return Container(
                    padding: const EdgeInsets.all(20),

                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.04),
                          blurRadius: 15,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),

                    child: Row(
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            color: primaryColor.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: const Icon(
                            Icons.notifications_active_outlined,
                            color: primaryColor,
                            size: 26,
                          ),
                        ),

                        const SizedBox(width: 15),

                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Notifications',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),

                              const SizedBox(height: 5),

                              Text(
                                state.isSwitch
                                    ? 'Notifications are enabled'
                                    : 'Notifications are disabled',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: state.isSwitch
                                      ? Colors.green
                                      : Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),

                        Switch(
                          value: state.isSwitch,
                          activeColor: primaryColor,
                          onChanged: (newValue) {
                            context.read<SwitchBloc>().add(
                              EnableorDisableEvent(),
                            );
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),

              const SizedBox(height: 25),

              // Opacity Preview
              BlocBuilder<SwitchBloc, SwitchState>(
                buildWhen: (previous, current) =>
                previous.slider != current.slider,

                builder: (context, state) {
                  return Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),

                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.04),
                          blurRadius: 15,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        const Row(
                          children: [
                            Icon(
                              Icons.palette_outlined,
                              color: primaryColor,
                            ),
                            SizedBox(width: 10),
                            Text(
                              'Color Preview',
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 20),

                        Container(
                          height: 150,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.deepPurple.withOpacity(
                              state.slider,
                            ),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.color_lens_outlined,
                              color: Colors.white,
                              size: 45,
                            ),
                          ),
                        ),

                        const SizedBox(height: 15),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Opacity Level',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                              ),
                            ),

                            Text(
                              '${(state.slider * 100).round()}%',
                              style: const TextStyle(
                                color: primaryColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),

                        Slider(
                          value: state.slider,
                          min: 0,
                          max: 1,
                          activeColor: primaryColor,
                          onChanged: (value) {
                            context.read<SwitchBloc>().add(
                              SliderEvent(Slider: value),
                            );
                          },
                        ),

                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Transparent',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                              ),
                            ),
                            Text(
                              'Opaque',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}