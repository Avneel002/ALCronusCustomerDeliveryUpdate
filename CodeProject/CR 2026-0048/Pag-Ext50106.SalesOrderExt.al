pageextension 90107 SalesOrderExt extends "Sales Order"
{
    layout
    {
        addafter("Shipping and Billing")
        {
            group("Delivery Preferences")
            {
                Caption = 'Delivery Preferences';

                field(DeliveryTimePref; Rec.DeliveryTimePreference)
                {
                    ApplicationArea = All;
                    Caption = 'Delivery Time Preference';
                }

                field(DeliveryInstructions; Rec.DeliveryInstructions)
                {
                    ApplicationArea = All;
                    Caption = 'Delivery Instructions';
                    MultiLine = true;
                }

                field(DeliveryContactNo; Rec.DeliveryContactNo)
                {
                    ApplicationArea = All;
                    Caption = 'Delivery Contact Number';
                }

                field(DeliveryContactName; Rec.DeliveryContactName)
                {
                    ApplicationArea = All;
                    Caption = 'Delivery Contact Name';
                }

                field(DeliveryContactPhone; Rec.DeliveryContactPhone)
                {
                    ApplicationArea = All;
                    Caption = 'Delivery Contact Phone';
                }
            }
        }

        addfirst(factboxes)
        {
            part(DeliveryPrefencesFactBoxMgt; DeliveryPreferencesFactBoxMgt)
            {
                ApplicationArea = All;
                Caption = 'Delivery Preferences';
                SubPageLink = "No." = field("No."), "Document Type" = field("Document Type");
            }
        }
    }

    actions
    {
        addlast(processing)
        {
            group(Delivery)
            {
                Caption = 'Check Delivery';
                action(VerifyDeliveryDetails)
                {
                    ApplicationArea = All;
                    Caption = 'Verify Details';
                    trigger OnAction()
                    var
                        DeliveryMgt: Codeunit "DeliveryPreferenceMgt.";
                        DeliveryNotification: Notification;
                    begin
                        if DeliveryMgt.CompleteDeliveryInformation(Rec) then begin
                            Message('Delivery fields are finsihed');
                        end;
                        DeliveryNotification.Scope(NotificationScope::LocalScope);
                        DeliveryNotification.Message(DeliveryMgt.GetCompletionStatus(Rec));
                        if not DeliveryMgt.CompleteDeliveryInformation(Rec) then begin
                            DeliveryNotification.AddAction('fillout the delivery details', Codeunit::"DeliveryPreferenceMgt.", 'go to delivery tab');
                            DeliveryNotification.SetData('No', Rec."No.");
                        end;
                        DeliveryNotification.Message('Delivery has been verified.');
                    end;
                }
            }
        }
    }
}
