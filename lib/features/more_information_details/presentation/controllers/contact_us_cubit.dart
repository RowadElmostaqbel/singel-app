import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:single_resturant_app/features/more_information_details/data/models/contact_us_model.dart';
import 'package:single_resturant_app/features/more_information_details/data/repo/contact_us_repo.dart';

part 'contact_us_state.dart';

class ContactUsCubit extends Cubit<ContactUsState> {
  ContactUsRepo contactUsRepo;
  ContactUsModel contactUsModel = ContactUsModel();

  ContactUsCubit(this.contactUsRepo) : super(ContactUsInitial());

  addUserName(String userName) {
    contactUsModel.name = userName;
  }

  addEmail(String email) {
    contactUsModel.email = email;
  }

  addPhone(String phone) {
    contactUsModel.phone = phone;
  }

  messageType(String messageType) {
    contactUsModel.msg_type = messageType;
  }

  addMessage(String message) {
    contactUsModel.msg = message;
  }

  sendMessage() async {
    emit(ContactUsLoadingState());
    final response =
        await contactUsRepo.sendMessage(contactUsModel: contactUsModel);
    response.fold((failure) {
      emit(ContactUsFailureState(error: failure.msg));
    }, (message) {
      emit(ContactUsSuccessState());
    });
  }
}
