<section class="main-contactus">
    <div class="container">
        <div class="contact-form">
            <div class="contact-image">
                <img src="<?=base_url('uploads/images/contact.png')?>" alt="rocket_contact" />
            </div>
            <form method="POST">
                <h3><?=$this->lang->line('frontend_drop_us_message')?></h3>
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <input type="text" name="name" class="form-control <?=form_error('name') ? 'is-invalid' : ''?>" placeholder="Votre nom *" value="<?=set_value('name')?>" />
                        </div>
                        <div class="form-group">
                            <input type="text" name="email" class="form-control <?=form_error('email') ? 'is-invalid' : ''?>" placeholder="Votre email *" value="<?=set_value('email')?>" />
                        </div>
                        <div class="form-group">
                            <input type="text" name="subject" class="form-control <?=form_error('subject') ? 'is-invalid' : ''?>" placeholder="Votre Sujet *" value="<?=set_value('subject')?>" />
                        </div>
                        <div class="form-group">
                            <input type="submit" name="btnSubmit" class="btnContact" value="Envoyer" />
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <textarea name="message" class="form-control <?=form_error('message') ? 'is-invalid' : ''?>" rows="6" placeholder="Votre Message *"><?=set_value('message')?></textarea>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</section>