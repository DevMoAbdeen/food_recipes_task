import '../../../../core/networking/api/api_keys.dart';
import '../../domain/entities/user_data.dart';

class UserDataModel extends UserData {
  UserDataModel({
    required super.id,
    required super.firstName,
    required super.lastName,
    required super.maidenName,
    required super.age,
    required super.gender,
    required super.email,
    required super.phone,
    required super.username,
    required super.password,
    required super.birthDate,
    required super.image,
    required super.bloodGroup,
    required super.height,
    required super.weight,
    required super.eyeColor,
    required super.hairColor,
    required super.hairType,
    required super.ip,
    required super.address,
    required super.macAddress,
    required super.university,
    required super.bank,
    required super.company,
    required super.ein,
    required super.ssn,
    required super.userAgent,
    required super.crypto,
    required super.role,
  });

  factory UserDataModel.fromJson(Map<String, dynamic> json) {
    return UserDataModel(
      id: json[ApiKeys.id],
      firstName: json[ApiKeys.firstName],
      lastName: json[ApiKeys.lastName],
      maidenName: json[ApiKeys.maidenName],
      age: json[ApiKeys.age],
      gender: json[ApiKeys.gender],
      email: json[ApiKeys.email],
      phone: json[ApiKeys.phone],
      username: json[ApiKeys.username],
      password: json[ApiKeys.password],
      birthDate: json[ApiKeys.birthDate],
      image: json[ApiKeys.image],
      bloodGroup: json[ApiKeys.bloodGroup],
      height: json[ApiKeys.height]?.toDouble(),
      weight: json[ApiKeys.weight]?.toDouble(),
      eyeColor: json[ApiKeys.eyeColor],
      hairColor: json[ApiKeys.hairColor],
      hairType: json[ApiKeys.hairType],
      ip: json[ApiKeys.ip],
      address: json[ApiKeys.address] != null ? AddressModel.fromJson(json[ApiKeys.address]) : null,
      macAddress: json[ApiKeys.macAddress],
      university: json[ApiKeys.university],
      bank: json[ApiKeys.bank] != null ? BankModel.fromJson(json[ApiKeys.bank]) : null,
      company: json[ApiKeys.company] != null ? CompanyModel.fromJson(json[ApiKeys.company]) : null,
      ein: json[ApiKeys.ein],
      ssn: json[ApiKeys.ssn],
      userAgent: json[ApiKeys.userAgent],
      crypto: json[ApiKeys.crypto] != null ? CryptoModel.fromJson(json[ApiKeys.crypto]) : null,
      role: json[ApiKeys.role],
    );
  }

  factory UserDataModel.fromUserData(UserData user) {
    return UserDataModel(
      id: user.id,
      firstName: user.firstName,
      lastName: user.lastName,
      maidenName: user.maidenName,
      age: user.age,
      gender: user.gender,
      email: user.email,
      phone: user.phone,
      username: user.username,
      password: user.password,
      birthDate: user.birthDate,
      image: user.image,
      bloodGroup: user.bloodGroup,
      height: user.height,
      weight: user.weight,
      eyeColor: user.eyeColor,
      hairColor: user.hairColor,
      hairType: user.hairType,
      ip: user.ip,
      address: user.address != null ? AddressModel.fromAddress(user.address!) : null,
      macAddress: user.macAddress,
      university: user.university,
      bank: user.bank != null ? BankModel.fromBank(user.bank!) : null,
      company: user.company != null ? CompanyModel.fromCompany(user.company!) : null,
      ein: user.ein,
      ssn: user.ssn,
      userAgent: user.userAgent,
      crypto: user.crypto != null ? CryptoModel.fromCrypto(user.crypto!) : null,
      role: user.role,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      ApiKeys.id: id,
      ApiKeys.firstName: firstName,
      ApiKeys.lastName: lastName,
      ApiKeys.maidenName: maidenName,
      ApiKeys.age: age,
      ApiKeys.gender: gender,
      ApiKeys.email: email,
      ApiKeys.phone: phone,
      ApiKeys.username: username,
      ApiKeys.password: password,
      ApiKeys.birthDate: birthDate,
      ApiKeys.image: image,
      ApiKeys.bloodGroup: bloodGroup,
      ApiKeys.height: height,
      ApiKeys.weight: weight,
      ApiKeys.eyeColor: eyeColor,
      ApiKeys.hairColor: hairColor,
      ApiKeys.hairType: hairType,
      ApiKeys.ip: ip,
      ApiKeys.address: address != null ? AddressModel.fromAddress(address!).toMap() : null,
      ApiKeys.macAddress: macAddress,
      ApiKeys.university: university,
      ApiKeys.bank: bank != null ? BankModel.fromBank(bank!).toMap() : null,
      ApiKeys.company: company != null ? CompanyModel.fromCompany(company!).toMap() : null,
      ApiKeys.ein: ein,
      ApiKeys.ssn: ssn,
      ApiKeys.userAgent: userAgent,
      ApiKeys.crypto: crypto != null ? CryptoModel.fromCrypto(crypto!).toMap() : null,
      ApiKeys.role: role,
    };
  }
}

class CoordinatesModel extends Coordinates {
  CoordinatesModel({required super.lat, required super.lng});

  factory CoordinatesModel.fromJson(Map<String, dynamic> json) {
    return CoordinatesModel(
      lat: json[ApiKeys.lat]?.toDouble(),
      lng: json[ApiKeys.lng]?.toDouble(),
    );
  }

  factory CoordinatesModel.fromCoordinates(Coordinates coordinates) {
    return CoordinatesModel(
      lat: coordinates.lat,
      lng: coordinates.lng,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      ApiKeys.lat: lat,
      ApiKeys.lng: lng,
    };
  }
}

class AddressModel extends Address {
  AddressModel({
    required super.address,
    required super.city,
    required super.state,
    required super.stateCode,
    required super.postalCode,
    required super.coordinates,
    required super.country,
  });

  factory AddressModel.fromJson(Map<String, dynamic> json) {
    return AddressModel(
      address: json[ApiKeys.address],
      city: json[ApiKeys.city],
      state: json[ApiKeys.state],
      stateCode: json[ApiKeys.stateCode],
      postalCode: json[ApiKeys.postalCode],
      coordinates: json[ApiKeys.coordinates] != null ? CoordinatesModel.fromJson(json[ApiKeys.coordinates]) : null,
      country: json[ApiKeys.country],
    );
  }

  factory AddressModel.fromAddress(Address address) {
    return AddressModel(
      address: address.address,
      city: address.city,
      state: address.state,
      stateCode: address.stateCode,
      postalCode: address.postalCode,
      coordinates: address.coordinates != null ? CoordinatesModel.fromCoordinates(address.coordinates!) : null,
      country: address.country,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      ApiKeys.address: address,
      ApiKeys.city: city,
      ApiKeys.state: state,
      ApiKeys.stateCode: stateCode,
      ApiKeys.postalCode: postalCode,
      ApiKeys.coordinates: coordinates != null ? CoordinatesModel.fromCoordinates(coordinates!).toMap() : null,
      ApiKeys.country: country,
    };
  }
}

class BankModel extends Bank {
  BankModel({
    required super.cardExpire,
    required super.cardNumber,
    required super.cardType,
    required super.currency,
    required super.iban,
  });

  factory BankModel.fromJson(Map<String, dynamic> json) {
    return BankModel(
      cardExpire: json[ApiKeys.cardExpire],
      cardNumber: json[ApiKeys.cardNumber],
      cardType: json[ApiKeys.cardType],
      currency: json[ApiKeys.currency],
      iban: json[ApiKeys.iban],
    );
  }

  factory BankModel.fromBank(Bank bank) {
    return BankModel(
      cardExpire: bank.cardExpire,
      cardNumber: bank.cardNumber,
      cardType: bank.cardType,
      currency: bank.currency,
      iban: bank.iban,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      ApiKeys.cardExpire: cardExpire,
      ApiKeys.cardNumber: cardNumber,
      ApiKeys.cardType: cardType,
      ApiKeys.currency: currency,
      ApiKeys.iban: iban,
    };
  }
}

class CompanyModel extends Company {
  CompanyModel({
    required super.department,
    required super.name,
    required super.title,
    required super.address,
  });

  factory CompanyModel.fromJson(Map<String, dynamic> json) {
    return CompanyModel(
      department: json[ApiKeys.department],
      name: json[ApiKeys.name],
      title: json[ApiKeys.title],
      address: json[ApiKeys.address] != null ? AddressModel.fromJson(json[ApiKeys.address]) : null,
    );
  }

  factory CompanyModel.fromCompany(Company company) {
    return CompanyModel(
      department: company.department,
      name: company.name,
      title: company.title,
      address: company.address != null ? AddressModel.fromAddress(company.address!) : null,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      ApiKeys.department: department,
      ApiKeys.name: name,
      ApiKeys.title: title,
      ApiKeys.address: address != null ? AddressModel.fromAddress(address!).toMap() : null,
    };
  }
}

class CryptoModel extends Crypto {
  CryptoModel(
      {required super.coin, required super.wallet, required super.network});

  factory CryptoModel.fromJson(Map<String, dynamic> json) {
    return CryptoModel(
      coin: json[ApiKeys.coin],
      wallet: json[ApiKeys.wallet],
      network: json[ApiKeys.network],
    );
  }

  factory CryptoModel.fromCrypto(Crypto crypto) {
    return CryptoModel(
      coin: crypto.coin,
      wallet: crypto.wallet,
      network: crypto.network,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      ApiKeys.coin: coin,
      ApiKeys.wallet: wallet,
      ApiKeys.network: network,
    };
  }
}
