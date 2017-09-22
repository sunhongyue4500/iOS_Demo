defineClass('JPViewController', {
            handleBtn: function(sender) {
            require('UIAlertView');
            var alert = UIAlertView.alloc().initWithTitle_message_delegate_cancelButtonTitle_otherButtonTitles("bug已经修复", null, null, "ok", null, null);
            alert.show();
    }
})
