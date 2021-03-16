import 'package:flutter/material.dart';
import 'package:yia/common/BaseClass.dart';
import 'package:yia/common/StateMonitor.dart';
import 'package:yia/common/variables.dart';
import 'package:yia/common/widgets/customTextField/customTextFieldView.dart';
import 'package:yia/widgets/caseManagement/siteVisitForm/familyMembers/memberDataCollection/contactDetailView/contactDetailController.dart';
import 'package:yia/widgets/caseManagement/siteVisitForm/familyMembers/memberDataCollection/dataCard/dataCardView.dart';
import 'package:yia/widgets/caseManagement/siteVisitForm/familyMembers/memberDataCollection/textControllers.dart';

class ContactDetail extends StatefulWidget {
  final Key formKey;

  const ContactDetail({this.formKey});

  @override
  _ContactDetailState createState() => _ContactDetailState();
}

class _ContactDetailState extends State<ContactDetail>
    with View<ContactDetail> {
  ContactDetailController contactDetailController =
      new ContactDetailController();

  @override
  Widget getBody() {
    return DataCard(
      childWidget: Padding(
        padding: const EdgeInsets.only(
          left: 35.0,
          right: 35.0,
        ),
        child: Form(
          key: widget.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 15.0,
              ),
              Text(
                "Contact Details",
                style: dataCollectionCardTitle,
              ),
              SizedBox(
                height: 10.0,
              ),
              CustomTextField(
                promptText: "Home Number",
                promptStyle: dataCollectionCardText,
                inputStyle: dataCollectionCardTextFilled,
                textEditingController: TextControllers.homePhoneController,
              ),
              SizedBox(
                height: 10.0,
              ),
              CustomTextField(
                promptText: "Phone Number",
                promptStyle: dataCollectionCardText,
                inputStyle: dataCollectionCardTextFilled,
                textEditingController: TextControllers.mobilePhoneController,
              ),
              SizedBox(
                height: 10.0,
              ),
              CustomTextField(
                promptText: "Residence Address",
                promptStyle: dataCollectionCardText,
                inputStyle: dataCollectionCardTextFilled,
                textEditingController:
                    TextControllers.residenceAddressController,
              ),
              SizedBox(
                height: 10.0,
              ),
              CustomTextField(
                  promptText: "Name of Responsible Party",
                  promptStyle: dataCollectionCardText,
                  inputStyle: dataCollectionCardTextFilled,
                  textEditingController:
                      TextControllers.responsiblePartyNameController),
              SizedBox(
                height: 10.0,
              ),
              CustomTextField(
                promptText: "Relationship with Responsible Party",
                promptStyle: dataCollectionCardText,
                inputStyle: dataCollectionCardTextFilled,
                textEditingController:
                    TextControllers.responsiblePartyRelationshipController,
              ),
              SizedBox(
                height: 10.0,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Controller getController() {
    return contactDetailController;
  }

  @override
  InstanceNames getName() {
    return InstanceNames.ContactDetail;
  }
}
