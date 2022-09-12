Item testItem = Item(
        userId: '62e393a5fb12b967fea3d9d0',
        id: '62e393a5fb12b967fea3d9d0',
        title: 'abcefghijklmnopqrstuvwxyztest',
        taxIncluded: true,
        modifiedDate: DateTime.parse("2022-08-11T09:12:11.524Z"),
        creationDate: DateTime.parse("2022-08-11T09:12:11.524Z"),
        tax: 0.19,
        discount: 0.02,
        pricePerUnit: 17.625,
        taxedAmount: 15,
        description: "Bricks for construction"
    );
    Client testClient = Client(
        userId: '62e393a5fb12b967fea3d9d0',
        name: "name",
        streetName: "streetName",
        streetNumber: "streetNumber",
        postalCode: "postalCode",
        city: "city",
        phoneNumber: "019285973935",
        email: "email@s.ds",
        creationDate: DateTime.parse("2022-08-11T09:12:11.524Z"),
        modifiedDate: DateTime.parse("2022-08-11T09:12:11.524Z"),
        id: '62e393a5fb12b967fea3d9d0');

    Invoice testInvoice = Invoice(
        userId: '62e393a5fb12b967fea3d9d0',
        clientId: '62e393a5fb12b967fea3d9d0',
        discount: 0.2,
        paymentInformation: PaymentInformation(type: "type", details: "details"),
        itemList: [DetailedItem(quantity: 13, quantityIdentifier : "kg", id: "62e393a5fb12b967fea3d9d0")],
        isPaid: true,
        paymentAfterTaxAndDiscount: 423.16,
        paymentDate: DateTime.parse("2022-08-11T09:12:11.524Z"),
        creationDate: DateTime.parse("2022-08-11T09:12:11.524Z"),
        deliveryDate: DateTime.parse("2022-08-11T09:12:11.524Z"),
        invoiceNumber: "disnd39523",
        modifiedDate: DateTime.parse("2022-08-11T09:12:11.524Z"),
        id: '62e393a5fb12b967fea3d9d0');

    User testUser = User(
        id: '62e393a5fb12b967fea3d9d0',
        name: "sigmund",
        billingInformation: BillingInformation(taxNumber: "5474352354", germanUstId: "123423634623", streetName: "streetName", paymentInformation: PaymentInformation(details: 'rerwerwerwe', type: 'other'), streetNumber: "streetNumber", postalCode: "435234", city: "city", phoneNumber: "4353475323423"),
        locale: Locale.DE,
        email: "g@g.com",
        welcomeScreenData1: false,
        welcomeScreenData2: false,
        welcomeScreenData3: false,
        creationDate: DateTime.now(),
        purchaseToken: ["daweef32r34t45t23e23e"],
        hasPremium: false,
        originalTransactionId: "originalTransactionId",
        subscriptionExpirationDate: DateTime.now(),
        modifiedDate: DateTime.now()
    );
   // await context.read<ClientCubit>().insertClient(testClient);
   // print(context.read<ClientCubit>().state);
   // await context.read<ClientCubit>().updateClient(testClient.copyWth(name: "franz"));
   // print(context.read<ClientCubit>().state);
   // await context.read<ClientCubit>().fetchClient('62e393a5fb12b967fea3d9d0');
   // print(context.read<ClientCubit>().state);
   // await context.read<ClientCubit>().fetchClients(query: {"name": "franz"});
   // print(context.read<ClientCubit>().state);
   // await context.read<ClientCubit>().deleteClient("62e393a5fb12b967fea3d9d0");
   // print(context.read<ClientCubit>().state);

   // await context.read<UserCubit>().insertUser(testUser);
   // print(context.read<UserCubit>().state);
   // await context.read<UserCubit>().updateUser(testUser.copyWth(name: "franz"));
   // print(context.read<UserCubit>().state);
   // await context.read<UserCubit>().fetchUser('62e393a5fb12b967fea3d9d0');
   // print(context.read<UserCubit>().state);
   // await context.read<UserCubit>().fetchUsers(query: {"name": "franz"});
   // print(context.read<UserCubit>().state);
   // await context.read<UserCubit>().deleteUser("62e393a5fb12b967fea3d9d0");
   // print(context.read<UserCubit>().state);
