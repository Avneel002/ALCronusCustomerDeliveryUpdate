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
            part(DeliveryFactBox; "DeliveryPreferencesFactBoxMgt")
            {
                ApplicationArea = All;
                Caption = 'Delivery Preferences';
            }
        }
    }

    actions
    {

        addlast(processing)
        {
            group(Delivery)
            {
                Caption = 'Delivery';
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
                        DeliveryNotification.Message('Delivery has been verified.');
                    end;
                }
            }
        }
    }
}
