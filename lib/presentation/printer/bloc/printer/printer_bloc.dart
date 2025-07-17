import 'package:bloc/bloc.dart';
import 'package:eky_pos/data/datasources/auth_local_datasource.dart';
import 'package:eky_pos/data/datasources/db_local_datasource.dart';
import 'package:eky_pos/data/models/responses/printer_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:eky_pos/data/datasources/printer_remote_datasource.dart';
import 'package:eky_pos/data/models/requests/printer_request_model.dart';

part 'printer_bloc.freezed.dart';
part 'printer_event.dart';
part 'printer_state.dart';

class PrinterBloc extends Bloc<PrinterEvent, PrinterState> {
  
  PrinterBloc() : super(_Initial()) {

    final dbLocalDatasource = DBLocalDatasource.instance;

    on<_GetPrinters>((event, emit) async {
      emit(_Loading());
      final printer = PrinterResponseModel.fromMap({
        'data': [
          {
            'name': 'Printer 1',
            'connection_type': 'Bluetooth',
            'ip_address': '192.168.1.1',
            'mac_address': '00:1A:7D:DA:71:13',
            'paper_width': 58,
            'outlet_id': 0,
            'default': true,
          },
          {
            'name': 'Printer 2',
            'connection_type': 'Bluetooth',
            'ip_address': '192.168.1.1',
            'mac_address': '00:1A:7D:DA:71:13',
            'paper_width': 58,
            'outlet_id': 0,
            'default': false,
          }
        ],
      });
      emit(_Loaded(printer.data));
    });

    on<_AddPrinter>((event, emit) async {
      emit(_Loading());
      
    });

    on<_DeletePrinter>((event, emit) async {
      emit(_Loading());
     
    });
  }
}
