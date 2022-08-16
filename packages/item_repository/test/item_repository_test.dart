// ignore_for_file: prefer_const_constructors
import 'package:invoice_api/invoice_api.dart' as invoice_api;
import 'package:invoice_api/invoice_api.dart';
import 'package:item_repository/item_repository.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

class MockItemApiClient extends Mock
    implements invoice_api.ItemApiClient {}

class MockItem extends Mock implements invoice_api.Item { }
void main() {
  group('ItemRepository', () {
    late invoice_api.ItemApiClient itemApiClient;
    late ItemRepository itemRepository;

    setUp(() {
      itemApiClient = MockItemApiClient();
      itemRepository = ItemRepository(
        itemApiClient: itemApiClient,
      );
    });


    group('constructor', () {
      test('instantiates internal MetaWeatherApiClient when not injected', () {
        expect(ItemRepository(), isNotNull);
      });
    });

    group('getItem', () {
      const id = 'mock-query';
      test('calls getItem with correct id', () async {
        try {
          await itemRepository.getItem(id);
        } catch (_) {}
        verify(() => itemApiClient.getItemById(id)).called(1);
      });

      test('returns correct Item on success', () async {
        final item = MockItem();
        when(() => item.userId).thenReturn('62e393a5fb12b967fea3d9d0');
        when(() => item.id).thenReturn('62e393a5fb12b967fea3d9d0');
        when(() => item.title).thenReturn('abcefghijklmnopqrstuvwxyztest');
        when(() => item.taxInclude).thenReturn(true);
        when(() => item.tax).thenReturn(0.19);
        when(() => item.discount).thenReturn(0.02);
        when(() => item.pricePerUnit).thenReturn(17.625);
        when(() => item.creationDate).thenReturn(DateTime.parse("2022-08-11T09:12:11.524Z"));
        when(() => item.modifiedDate).thenReturn(DateTime.parse("2022-08-11T09:12:11.524Z"));
        when(() => item.taxedAmount).thenReturn(15);
        when(() => item.description).thenReturn("Bricks for construction");
        when(() => itemApiClient.getItemById(any())).thenAnswer(
              (_) async => item,
        );
        final actual = await itemRepository.getItem(id);
        expect(
          actual,
          Item(
            userId: '62e393a5fb12b967fea3d9d0',
            id: '62e393a5fb12b967fea3d9d0',
            title: 'abcefghijklmnopqrstuvwxyztest',
            taxInclude: true,
            modifiedDate: DateTime.parse("2022-08-11T09:12:11.524Z"),
            creationDate: DateTime.parse("2022-08-11T09:12:11.524Z"),
            tax: 0.19,
            discount: 0.02,
            pricePerUnit: 17.625,
            taxedAmount: 15,
            description: "Bricks for construction"
          ),
        );
      });

    });
  });
}
