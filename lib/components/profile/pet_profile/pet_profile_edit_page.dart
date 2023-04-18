/*
 * File: pet_profile_edit_page.dart
 * File Created: Tuesday, 18th April 2023 11:43:56 am
 * Author: Hieu Tran
 * -----
 * Last Modified: Tuesday, 18th April 2023 11:44:21 am
 * Modified By: Hieu Tran
 */

import 'package:cat_concierge/components/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart';
import 'package:one/one.dart';

import '../../../core/index.dart';

class PetProfileEditPage extends StatefulWidget {
  const PetProfileEditPage({super.key});

  @override
  State<PetProfileEditPage> createState() => _PetProfileEditPageState();
}

class _PetProfileEditPageState extends State<PetProfileEditPage> {
  Genders gender = Genders.male;
  Answer answer = Answer.yes;
  Actives actives = Actives.active;
  Maintenance maintenance = Maintenance.housekeeping;
  Appetites appetites = Appetites.good;
  @override
  Widget build(BuildContext context) {
    return KeyboardDismissOnTap(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Edit Profile'),
          actions: [
            OneButton.text(
              icon: const Icon(Icons.close_rounded),
              onTap: () => Get.back(),
            ),
          ],
        ),
        body: SafeArea(
          child: _buildBody(context),
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            padding: theme.spacing.edgeInsets,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const PetFamilyCardItem(
                  title: 'Pixel',
                  subtitle: '5 years old',
                ),
                SizedBox(height: theme.spacing.base),
                const AppTextField(
                  label: 'Name',
                  text: 'Pixel',
                ),
                SizedBox(height: theme.spacing.base),
                const AppTextField(
                  label: 'Age or dob',
                  text: '5 years old',
                ),
                SizedBox(height: theme.spacing.base),
                AppTextField(
                  readOnly: true,
                  focusedColor: gender == Genders.male ? AppColors.primaryLightest : null,
                  borderColor: gender == Genders.male ? AppColors.primaryLightest : null,
                  fillColor: gender == Genders.male ? AppColors.primaryLightest : null,
                  prefixIcon: gender == Genders.male ? MySvgs.ic_radio_true : MySvgs.ic_radio_false,
                  text: 'Male',
                  label: 'Gender',
                  onTap: () {
                    setState(() {
                      gender = Genders.male;
                    });
                  },
                ),
                SizedBox(height: theme.spacing.small),
                AppTextField(
                  readOnly: true,
                  focusedColor: gender == Genders.female ? AppColors.primaryLightest : null,
                  borderColor: gender == Genders.female ? AppColors.primaryLightest : null,
                  fillColor: gender == Genders.female ? AppColors.primaryLightest : null,
                  prefixIcon: gender == Genders.female ? MySvgs.ic_radio_true : MySvgs.ic_radio_false,
                  text: 'Female',
                  onTap: () {
                    setState(() {
                      gender = Genders.female;
                    });
                  },
                ),
                SizedBox(height: theme.spacing.base),
                AppTextField(
                  readOnly: true,
                  focusedColor: answer == Answer.yes ? AppColors.primaryLightest : null,
                  borderColor: answer == Answer.yes ? AppColors.primaryLightest : null,
                  fillColor: answer == Answer.yes ? AppColors.primaryLightest : null,
                  prefixIcon: answer == Answer.yes ? MySvgs.ic_radio_true : MySvgs.ic_radio_false,
                  text: 'Yes',
                  label: 'Sterilized',
                  onTap: () {
                    setState(() {
                      answer = Answer.yes;
                    });
                  },
                ),
                SizedBox(height: theme.spacing.small),
                AppTextField(
                  readOnly: true,
                  focusedColor: answer == Answer.no ? AppColors.primaryLightest : null,
                  borderColor: answer == Answer.no ? AppColors.primaryLightest : null,
                  fillColor: answer == Answer.no ? AppColors.primaryLightest : null,
                  prefixIcon: answer == Answer.no ? MySvgs.ic_radio_true : MySvgs.ic_radio_false,
                  text: 'No',
                  onTap: () {
                    setState(() {
                      answer = Answer.no;
                    });
                  },
                ),
                SizedBox(height: theme.spacing.base),
                const AppTextField(
                  label: 'Breed',
                  text: '3 kg',
                ),
                AppTextField(
                  readOnly: true,
                  focusedColor: actives == Actives.active ? AppColors.primaryLightest : null,
                  borderColor: actives == Actives.active ? AppColors.primaryLightest : null,
                  fillColor: actives == Actives.active ? AppColors.primaryLightest : null,
                  prefixIcon: actives == Actives.active ? MySvgs.ic_radio_true : MySvgs.ic_radio_false,
                  text: 'Active',
                  label: 'Activity',
                  onTap: () {
                    setState(() {
                      actives = Actives.active;
                    });
                  },
                ),
                SizedBox(height: theme.spacing.small),
                AppTextField(
                  readOnly: true,
                  focusedColor: actives == Actives.normal ? AppColors.primaryLightest : null,
                  borderColor: actives == Actives.normal ? AppColors.primaryLightest : null,
                  fillColor: actives == Actives.normal ? AppColors.primaryLightest : null,
                  prefixIcon: actives == Actives.normal ? MySvgs.ic_radio_true : MySvgs.ic_radio_false,
                  text: 'Normal',
                  onTap: () {
                    setState(() {
                      actives = Actives.normal;
                    });
                  },
                ),
                SizedBox(height: theme.spacing.small),
                AppTextField(
                  readOnly: true,
                  focusedColor: actives == Actives.passive ? AppColors.primaryLightest : null,
                  borderColor: actives == Actives.passive ? AppColors.primaryLightest : null,
                  fillColor: actives == Actives.passive ? AppColors.primaryLightest : null,
                  prefixIcon: actives == Actives.passive ? MySvgs.ic_radio_true : MySvgs.ic_radio_false,
                  text: 'Passive',
                  onTap: () {
                    setState(() {
                      actives = Actives.passive;
                    });
                  },
                ),
                SizedBox(height: theme.spacing.base),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: theme.spacing.small),
                  child: Text('Medical Conditionals', style: AppTextStyle.fromContext(context).headingH5),
                ),
                Column(
                    children: listOptions.map((e) {
                  return _buildItemOption(
                    context,
                    e,
                  );
                }).toList()),
                SizedBox(height: theme.spacing.base),
                AppTextField(
                  readOnly: true,
                  focusedColor: maintenance == Maintenance.housekeeping ? AppColors.primaryLightest : null,
                  borderColor: maintenance == Maintenance.housekeeping ? AppColors.primaryLightest : null,
                  fillColor: maintenance == Maintenance.housekeeping ? AppColors.primaryLightest : null,
                  prefixIcon: maintenance == Maintenance.housekeeping ? MySvgs.ic_radio_true : MySvgs.ic_radio_false,
                  text: 'Housekeeping',
                  label: 'Maintenance',
                  onTap: () {
                    setState(() {
                      maintenance = Maintenance.housekeeping;
                    });
                  },
                ),
                SizedBox(height: theme.spacing.small),
                AppTextField(
                  readOnly: true,
                  focusedColor: maintenance == Maintenance.goes_outside ? AppColors.primaryLightest : null,
                  borderColor: maintenance == Maintenance.goes_outside ? AppColors.primaryLightest : null,
                  fillColor: maintenance == Maintenance.goes_outside ? AppColors.primaryLightest : null,
                  prefixIcon: maintenance == Maintenance.goes_outside ? MySvgs.ic_radio_true : MySvgs.ic_radio_false,
                  text: 'Goes for a walk outside',
                  onTap: () {
                    setState(() {
                      maintenance = Maintenance.goes_outside;
                    });
                  },
                ),
                SizedBox(height: theme.spacing.base),
                AppTextField(
                  readOnly: true,
                  focusedColor: appetites == Appetites.good ? AppColors.primaryLightest : null,
                  borderColor: appetites == Appetites.good ? AppColors.primaryLightest : null,
                  fillColor: appetites == Appetites.good ? AppColors.primaryLightest : null,
                  prefixIcon: appetites == Appetites.good ? MySvgs.ic_radio_true : MySvgs.ic_radio_false,
                  text: 'Good',
                  label: 'Appetite',
                  onTap: () {
                    setState(() {
                      appetites = Appetites.good;
                    });
                  },
                ),
                SizedBox(height: theme.spacing.small),
                AppTextField(
                  readOnly: true,
                  focusedColor: appetites == Appetites.bad ? AppColors.primaryLightest : null,
                  borderColor: appetites == Appetites.bad ? AppColors.primaryLightest : null,
                  fillColor: appetites == Appetites.bad ? AppColors.primaryLightest : null,
                  prefixIcon: appetites == Appetites.bad ? MySvgs.ic_radio_true : MySvgs.ic_radio_false,
                  text: 'Bad',
                  onTap: () {
                    setState(() {
                      appetites = Appetites.bad;
                    });
                  },
                ),
                SizedBox(height: theme.spacing.small),
                AppTextField(
                  readOnly: true,
                  focusedColor: appetites == Appetites.pickyinfood ? AppColors.primaryLightest : null,
                  borderColor: appetites == Appetites.pickyinfood ? AppColors.primaryLightest : null,
                  fillColor: appetites == Appetites.pickyinfood ? AppColors.primaryLightest : null,
                  prefixIcon: appetites == Appetites.pickyinfood ? MySvgs.ic_radio_true : MySvgs.ic_radio_false,
                  text: 'Picky in food',
                  onTap: () {
                    setState(() {
                      appetites = Appetites.pickyinfood;
                    });
                  },
                ),
                SizedBox(height: theme.spacing.base),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: theme.spacing.small),
                  child: Text('Foods', style: AppTextStyle.fromContext(context).headingH5),
                ),
                Column(
                    children: listFoods.map((e) {
                  return _buildItemOption(
                    context,
                    e,
                  );
                }).toList()),
                SizedBox(height: theme.spacing.base),
                const AppTextField(
                  label: 'Amount of Food',
                  text: '150 g',
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: theme.spacing.edgeInsets,
          child: _buildSaveBtn(context),
        ),
      ],
    );
  }

  Widget _buildItemOption(BuildContext context, Options item) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: AppTextField(
        readOnly: true,
        selectionEnable: false,
        focusedColor: item.isSelected ? AppColors.primaryLightest : AppColors.lightGrey,
        borderColor: item.isSelected ? AppColors.primaryLightest : null,
        fillColor: item.isSelected ? AppColors.primaryLightest : null,
        suffixIcon: item.isSelected ? MySvgs.ic_check : null,
        suffixColor: AppColors.primary,
        text: item.name,
        onTap: () {
          setState(() {
            item.isSelected = !item.isSelected;
          });
        },
      ),
    );
  }

  Widget _buildSaveBtn(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: OneButton.elevated(
        label: const Text('Save Changes', style: TextStyle(color: Colors.white)),
        onTap: () {},
      ),
    );
  }
}
