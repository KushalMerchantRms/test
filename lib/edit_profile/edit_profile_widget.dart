import '/backend/api_requests/api_calls.dart';
import '/components/no_internet_popup_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'edit_profile_model.dart';
export 'edit_profile_model.dart';

class EditProfileWidget extends StatefulWidget {
  const EditProfileWidget({super.key});

  static String routeName = 'EditProfile';
  static String routePath = '/editProfile';

  @override
  State<EditProfileWidget> createState() => _EditProfileWidgetState();
}

class _EditProfileWidgetState extends State<EditProfileWidget> {
  late EditProfileModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditProfileModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await actions.checkInternetConnection(
        context,
        () async {
          await showDialog(
            barrierDismissible: false,
            context: context,
            builder: (dialogContext) {
              return Dialog(
                elevation: 0,
                insetPadding: EdgeInsets.zero,
                backgroundColor: Colors.transparent,
                alignment: AlignmentDirectional(0.0, 0.0)
                    .resolve(Directionality.of(context)),
                child: GestureDetector(
                  onTap: () {
                    FocusScope.of(dialogContext).unfocus();
                    FocusManager.instance.primaryFocus?.unfocus();
                  },
                  child: NoInternetPopupWidget(),
                ),
              );
            },
          );
        },
      );
      FFAppState().CountryCode = '';
      FFAppState().profileBaseURL = '';
      safeSetState(() {});
      _model.success = await actions.refreshToken(
        FFAppState().token,
      );
      if (_model.success!) {
        _model.apiResultsni = await APIsAllGroup.refreshTokenCall.call(
          refreshToken: FFAppState().refreshToken,
        );

        if ((_model.apiResultsni?.succeeded ?? true)) {
          FFAppState().token = APIsAllGroup.refreshTokenCall.accessToken(
            (_model.apiResultsni?.jsonBody ?? ''),
          )!;
          FFAppState().refreshToken =
              APIsAllGroup.refreshTokenCall.refreshToken(
            (_model.apiResultsni?.jsonBody ?? ''),
          )!;
          safeSetState(() {});
        }
      }
      FFAppState().userCountryCode = FFAppState().finalCountryCode;
      safeSetState(() {});
    });

    _model.firstNameFocusNode ??= FocusNode();

    _model.lastNameFocusNode ??= FocusNode();

    _model.phonNumberTextController ??=
        TextEditingController(text: FFAppState().userMobileNumber);
    _model.phonNumberFocusNode ??= FocusNode();

    _model.emailFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Builder(
      builder: (context) => GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          appBar: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).primary,
            automaticallyImplyLeading: false,
            leading: FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 30.0,
              borderWidth: 1.0,
              buttonSize: 60.0,
              icon: Icon(
                Icons.chevron_left_rounded,
                color: Colors.white,
                size: 30.0,
              ),
              onPressed: () async {
                context.pop();
              },
            ),
            title: Text(
              'Edit Profile',
              style: FlutterFlowTheme.of(context).headlineMedium.override(
                    fontFamily: 'Inter',
                    color: Colors.white,
                    fontSize: 18.0,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            actions: [],
            centerTitle: false,
            elevation: 0.0,
          ),
          body: FutureBuilder<ApiCallResponse>(
            future: APIsAllGroup.userProfileCall.call(
              authToken: FFAppState().token,
            ),
            builder: (context, snapshot) {
              // Customize what your widget looks like when it's loading.
              if (!snapshot.hasData) {
                return Center(
                  child: SizedBox(
                    width: 50.0,
                    height: 50.0,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        FlutterFlowTheme.of(context).primary,
                      ),
                    ),
                  ),
                );
              }
              final columnUserProfileResponse = snapshot.data!;

              return Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: 0.0,
                    height: 0.0,
                    child: custom_widgets.InitializeFCMWidget(
                      width: 0.0,
                      height: 0.0,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          16.0, 20.0, 16.0, 10.0),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(0.0, -1.0),
                              child: Container(
                                width: 150.0,
                                height: 150.0,
                                child: custom_widgets.UpdatePofilePic(
                                  width: 150.0,
                                  height: 150.0,
                                  avatar: valueOrDefault<String>(
                                    APIsAllGroup.userProfileCall.avatar(
                                      columnUserProfileResponse.jsonBody,
                                    ),
                                    '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',
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 48.0, 0.0, 0.0),
                              child: Text(
                                'First Name',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Inter',
                                      color: Color(0xFF313131),
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 10.0, 0.0, 0.0),
                              child: TextFormField(
                                controller: _model.firstNameTextController ??=
                                    TextEditingController(
                                  text: APIsAllGroup.userProfileCall.firstName(
                                    columnUserProfileResponse.jsonBody,
                                  ),
                                ),
                                focusNode: _model.firstNameFocusNode,
                                autofocus: false,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        letterSpacing: 0.0,
                                      ),
                                  hintText: 'Name',
                                  hintStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        color: Color(0xFFBBBBBB),
                                        letterSpacing: 0.0,
                                      ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xFFBDBDBD),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  contentPadding:
                                      EdgeInsetsDirectional.fromSTEB(
                                          14.0, 10.0, 14.0, 10.0),
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Inter',
                                      color: Color(0xFF464646),
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                                validator: _model
                                    .firstNameTextControllerValidator
                                    .asValidator(context),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 16.0, 0.0, 0.0),
                              child: Text(
                                'Last name',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Inter',
                                      color: Color(0xFF313131),
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 10.0, 0.0, 0.0),
                              child: TextFormField(
                                controller: _model.lastNameTextController ??=
                                    TextEditingController(
                                  text: APIsAllGroup.userProfileCall.lastName(
                                    columnUserProfileResponse.jsonBody,
                                  ),
                                ),
                                focusNode: _model.lastNameFocusNode,
                                autofocus: false,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        letterSpacing: 0.0,
                                      ),
                                  hintText: 'Name',
                                  hintStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        color: Color(0xFFBBBBBB),
                                        letterSpacing: 0.0,
                                      ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xFFBDBDBD),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  contentPadding:
                                      EdgeInsetsDirectional.fromSTEB(
                                          14.0, 10.0, 14.0, 10.0),
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Inter',
                                      color: Color(0xFF464646),
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                                validator: _model
                                    .lastNameTextControllerValidator
                                    .asValidator(context),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 16.0, 0.0, 0.0),
                              child: Text(
                                'Mobile number',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Inter',
                                      color: Color(0xFF313131),
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 10.0, 0.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Flexible(
                                    child: Container(
                                      width: double.infinity,
                                      height: 48.0,
                                      child: custom_widgets.CountryPicker(
                                        width: double.infinity,
                                        height: 48.0,
                                        countryCode:
                                            FFAppState().userCountryCode,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 4,
                                    child: TextFormField(
                                      controller:
                                          _model.phonNumberTextController,
                                      focusNode: _model.phonNumberFocusNode,
                                      autofocus: false,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              letterSpacing: 0.0,
                                            ),
                                        hintText: 'Number',
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              color: Color(0xFFBBBBBB),
                                              letterSpacing: 0.0,
                                            ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0xFFBDBDBD),
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        contentPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                14.0, 10.0, 14.0, 10.0),
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            color: Color(0xFF464646),
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                      keyboardType: TextInputType.number,
                                      validator: _model
                                          .phonNumberTextControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                ].divide(SizedBox(width: 10.0)),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 16.0, 0.0, 0.0),
                              child: Text(
                                'Email',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Inter',
                                      color: Color(0xFF313131),
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 10.0, 0.0, 0.0),
                              child: TextFormField(
                                controller: _model.emailTextController ??=
                                    TextEditingController(
                                  text: APIsAllGroup.userProfileCall.email(
                                    columnUserProfileResponse.jsonBody,
                                  ),
                                ),
                                focusNode: _model.emailFocusNode,
                                autofocus: false,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        letterSpacing: 0.0,
                                      ),
                                  hintText: 'Email',
                                  hintStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        color: Color(0xFFBBBBBB),
                                        letterSpacing: 0.0,
                                      ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xFFBDBDBD),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  contentPadding:
                                      EdgeInsetsDirectional.fromSTEB(
                                          14.0, 10.0, 14.0, 10.0),
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Inter',
                                      color: Color(0xFF464646),
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                                validator: _model.emailTextControllerValidator
                                    .asValidator(context),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 10.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 8.0, 0.0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                context.safePop();
                              },
                              text: 'Close',
                              options: FFButtonOptions(
                                height: 45.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    24.0, 0.0, 24.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                textStyle: TextStyle(
                                  color: FlutterFlowTheme.of(context).primary,
                                ),
                                elevation: 0.0,
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).primary,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                8.0, 0.0, 0.0, 0.0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                FFAppState().userMobileNumber =
                                    _model.phonNumberTextController.text;
                                FFAppState().finalCountryCode =
                                    FFAppState().userCountryCode;
                                safeSetState(() {});
                                _model.updateprofileResult =
                                    await APIsAllGroup.updateProfileCall.call(
                                  authToken: FFAppState().token,
                                  firstName:
                                      _model.firstNameTextController.text,
                                  lastName: _model.lastNameTextController.text,
                                  email: _model.emailTextController.text,
                                  mobile:
                                      '${FFAppState().finalCountryCode}${FFAppState().userMobileNumber}',
                                  avatar: FFAppState().profileBaseURL,
                                );

                                if ((_model.updateprofileResult?.succeeded ??
                                    true)) {
                                  _model.apiResultnuu2 =
                                      await APIsAllGroup.getAvatarCall.call(
                                    authToken: FFAppState().token,
                                  );

                                  if ((_model.apiResultnuu2?.succeeded ??
                                      true)) {
                                    FFAppState().avatar =
                                        functions.getAvatarById(
                                            (_model.apiResultnuu2?.jsonBody ??
                                                ''),
                                            FFAppState().userId)!;
                                    FFAppState().email =
                                        _model.emailTextController.text;
                                    FFAppState().update(() {});
                                    await actions.toastMesg(
                                      context,
                                      'Successfully updated',
                                    );
                                  }
                                  context.safePop();
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Try again',
                                        style: TextStyle(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                        ),
                                      ),
                                      duration: Duration(milliseconds: 4000),
                                      backgroundColor:
                                          FlutterFlowTheme.of(context)
                                              .secondary,
                                    ),
                                  );
                                }

                                safeSetState(() {});
                              },
                              text: 'Save Change',
                              options: FFButtonOptions(
                                height: 45.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    24.0, 0.0, 24.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).primary,
                                textStyle: TextStyle(
                                  color: Colors.white,
                                ),
                                elevation: 0.0,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
