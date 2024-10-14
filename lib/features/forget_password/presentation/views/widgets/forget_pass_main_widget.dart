import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hire_me/features/forget_password/presentation/views/chang_pass_success_view.dart';
import '../../../../../core/common/functions.dart';
import '../../../../../core/widgets/button.dart';
import '../../../../../core/widgets/text_field.dart';
import '../../manager/forget_pass_cubit/forget_pass_cubit.dart';
import '../../manager/forget_pass_cubit/forget_pass_state.dart';

class ForgetPassMainWidget extends StatelessWidget {
  final Size size;
  const ForgetPassMainWidget({
    super.key,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    var bloc = BlocProvider.of<ForgetPassCubit>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: Form(
        key: bloc.formKey,
        child: Column(
          children: [
            CustomTextField(
              keyboardType: TextInputType.emailAddress,
              hintText: 'Email',
              prefixIcon: Icons.email,
              controller: bloc.emailController,
              validationValue: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your email';
                }
                return null;
              },
            ),
            const SizedBox(height: 15),
            BlocConsumer<ForgetPassCubit, ForgetPassState>(
              listener: (context, state) {
                if (state is ForgetPassSuccess) {
                  CommonFunctions().navWithoutReplacement(
                    context: context,
                    pageName: const ChangPassSuccessView(),
                  );
                }
                if (state is ForgetPassFailure) {
                  log(state.errorMessage);
                  CommonFunctions().showToastMessage(
                    msg: state.errorMessage,
                    context: context,
                    color: Colors.red,
                  );
                }
              },
              builder: (context, state) {
                return CustomButton(
                  isLoading: state is ForgetPassLoading ? true : false,
                  text: 'Send',
                  onPressed: () {
                    if (bloc.formKey.currentState!.validate()) {
                      bloc.resetPassword();
                    }
                  },
                  size: size,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
