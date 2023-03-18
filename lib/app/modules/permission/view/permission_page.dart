import 'dart:io';

import 'package:fibotech/app/modules/home/cubit/home_cubit.dart';
import 'package:fibotech/app/modules/permission/cubit/permission_page_cubit.dart';
import 'package:fibotech/core/mixin/after_first_layout_mixin.dart';
import 'package:fibotech/data/enums.dart';
import 'package:fibotech/widgets/container_box_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PermissionPage extends StatefulWidget {
  const PermissionPage({Key? key}) : super(key: key);

  @override
  State<PermissionPage> createState() => _PermissionPageState();
}

class _PermissionPageState extends State<PermissionPage>  with AfterFirstLayoutMixin{
  
  final controller = PageController();
  late PagePermissionCubit cubit ;
  late BuildContext buildcontext ; 

  @override
  void dispose() {      
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return  BlocProvider(
      create: (context) => PagePermissionCubit(homeCubit: context.read<HomeCubit>(), controller: controller, ),
      child: Scaffold(
          appBar: AppBar(title: const Text('Permisos')),
          body: BlocBuilder<PagePermissionCubit, PagePermissionState>(
            builder: (context, state) {
               cubit = context.read<PagePermissionCubit>();
              
              switch(state.statusPermission){
                case GpsPermissionStatus.successFull:
                  return const SizedBox();                                    
                case GpsPermissionStatus.pure:
                  return PageView(              
                    controller: controller,                                                                                       
                    physics: const NeverScrollableScrollPhysics(),
                    children:  [              
                      PageViewItem(
                        svg: 'assets/svg/permision_svg_1.svg',
                        description: 'ITeam recopila datos de la ubicación para permitir el seguimiento del proceso de toma de asistencia, es necesario para mostrar tus tiendas en el mapa y en la recolección correcta de información para la toma de asistencia incluso cuando la aplicación esté en segundo plano o no esté en uso.',
                        changedPage:() async{
                          await cubit.getPermissionStatus(controller: controller);
                          if(Platform.isAndroid)return;                              
                          
                        },
                      ),                  
                      PageViewItem(
                        svg: 'assets/svg/permision_svg_2.svg',
                        description: 'ITeam',
                        changedPage: () async{        
                          await cubit.getAppTransparency(); 
                        },                          
                      ),                                                                  
                    ],
                  );
                  case GpsPermissionStatus.notactivated:
                  return  Container(
                    margin:  EdgeInsets.symmetric(vertical: size.height < 750 ? 50 : 100 ),
                    child: ContainerBoxCard(                      
                      child: Column(
                        children: [
                          const Text('Activa tu gps '),
                          Expanded(child: SvgPicture.asset('assets/svg/permision_svg_3.svg',height: 180,)),
                        ],
                      ),
                    ),
                  );        

                  default:
                  return const Center(child:  CircularProgressIndicator());

                
              }
            }
          ,),
        ),
    );
    
  }

  @override
  void onAfterFirstLayout() {
    cubit.init();
  }

}

class PageViewItem extends StatelessWidget {
  const PageViewItem({Key? key, required this.svg, required this.description, required this.changedPage}) : super(key: key);

  final String svg; 
  final String description; 
  
  // ignore: inference_failure_on_function_return_type
  final void Function() changedPage;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      margin:  EdgeInsets.symmetric(vertical: size.height < 750 ? 50 : 100 ),
      child: ContainerBoxCard(        
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Flexible(
              flex: description.length > 250 ?   4 : 2,
              child: Text(description),
            ),          
            Expanded(
                flex: description.length > 250 ?   2 : 9,
              child: SvgPicture.asset(svg,height: 180,),            
            ),          
            Expanded(
              
              child: MaterialButton(
                onPressed: changedPage,
                child: const Text('Conceder Permiso'),
              ),
            )          
          ],
        ),
        
      ),
    );
    
  }
}
